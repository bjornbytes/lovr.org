local html = require 'html'
local md = require 'markdown'

return function(v)
  local api = loadfile('.lovr-docs/' .. v .. '/api/init.lua')()
  local guides = loadfile('.lovr-docs/' .. v .. '/guides/init.lua')()
  local examples = loadfile('.lovr-docs/' .. v .. '/examples/init.lua')()

  local lookup = {}
  local tags = {}
  local categories = {}
  local content = {}

  -- Track/glob everything

  local function track(things, category)
    for _, thing in ipairs(things) do
      local key = thing.key

      if thing.tag then
        local tag = thing.tag
        tags[tag] = tags[tag] or {}
        table.insert(tags[tag], key)
      end

      categories[category] = categories[category] or {}
      table.insert(categories[category], key)

      lookup[key] = thing
    end
  end

  track(api.modules, 'modules')
  track(api.callbacks, 'callbacks')
  for _, module in ipairs(api.modules) do
    track(module.functions, 'functions')
    track(module.enums, 'types')
    track(module.objects, 'objects')
    for _, object in ipairs(module.objects) do
      track(object.methods, 'functions')
    end
  end

  categories.guides = {}
  for _, key in ipairs(guides) do
    table.insert(categories.guides, key)
  end

  categories.examples = {}
  for _, key in ipairs(examples) do
    local group = key:match('(.-)/')
    if group then
      if not categories.examples[group] then
        categories.examples[group] = {}
        table.insert(categories.examples, group)
      end
      table.insert(categories.examples[group], key)
    else
      table.insert(categories.examples, key)
    end
  end

  -- Postprocessing (sort stuff, add automatic "related" entries)

  for tag, list in pairs(tags) do
    table.sort(list)
  end

  for category, keys in pairs(categories) do
    if category ~= 'guides' and category ~= 'examples' then
      table.sort(keys)
    end
  end

  local function relate(t, key, friend)
    if friend ~= key and lookup[friend] then
      table.insert(t, friend)
    end
  end

  for _, key in ipairs(categories.functions) do
    local fn = lookup[key]
    fn.related = fn.related or {}
    relate(fn.related, key, key:gsub('get', 'set'))
    relate(fn.related, key, key:gsub('is', 'set'))
    relate(fn.related, key, key:gsub('set', 'get'))
    relate(fn.related, key, key:gsub('set', 'is'))
    relate(fn.related, key, key:match('^(%w+):') or fn.module)
  end

  for _, key in ipairs(categories.objects) do
    local object = lookup[key]
    object.related = object.related or {}
    table.insert(object.related, object.extends)
    table.insert(object.related, object.module)
    table.sort(object.methods, function(a, b)
      return a.key < b.key
    end)
  end

  for _, key in ipairs(categories.types) do
    local enum = lookup[key]
    enum.related = enum.related or {}
    table.insert(enum.related, enum.module)
  end

  -- Render HTML

  local function imap(t, f)
    local u = {}
    for i = 1, #t do
      u[i] = f(t[i])
    end
    return u
  end

  local function notes(_ENV, x)
    if x.notes then
      return { h2 { 'Notes' }, md(x.notes) or '' }
    else
      return ''
    end
  end

  local function snippets(_ENV, x)
    if x.examples then
      return {
        h2 { #x.examples > 1 and 'Examples' or 'Example' },
        imap(x.examples, function(example)
          return {
            example.description and md(example.description) or '',
            pre { code { example.code } }
          }
        end)
      }
    else
      return ''
    end
  end

  local function related(_ENV, x)
    if x.related and #x.related > 0 then
      return {
        h2 { 'See also' },
        ul {
          imap(x.related, function(key)
            return li { code { key } }
          end)
        }
      }
    else
      return ''
    end
  end

  for _, guide in ipairs(categories.guides) do
    local filename = ('.lovr-docs/%s/guides/%s.md'):format(v, guide)
    if unix.stat(filename) then
      content[guide] = md(assert(Slurp(filename)))

      -- Add id slugs to headers
      for i = 2, 3 do
        content[guide] = content[guide]:gsub(('<h%d>(.-)</h%d>'):format(i, i), function(title)
          local slug = title:gsub(' ', '-'):gsub('Ö', 'O'):gsub('[^%w-]+', ''):lower()
          return ('<h%d id="%s"><a href="#%s">%s</a></h%d>'):format(i, slug, slug, title, i)
        end)
      end
    end
  end

  for _, example in ipairs(examples) do
    local filename = ('.lovr-docs/%s/examples/%s/main.lua'):format(v, example)
    if unix.stat(filename) then
      local contents = assert(Slurp(filename))
      local title = example:gsub('_', ' '):gsub('.+/', '')

      content[example] = html(function(_ENV)
        return {
          h1 { title },
          pre { code { contents } }
        }
      end)
    end
  end

  for _, key in ipairs(categories.modules) do
    content[key] = html(function(_ENV, module)
      local links

      if module.sections then
        links = imap(module.sections, function(section)
          return {
            h2 { section.name },
            section.description and md(section.description) or '',
            table {
              imap(tags[section.tag], function(link)
                return tr {
                  td { class = 'pre', link },
                  td { lookup[link].summary }
                }
              end)
            }
          }
        end)
      else
        links = {
          h2 'Functions',
          table {
            imap(module.functions, function(fn)
              return tr {
                td { class = 'pre', fn.key },
                td { fn.summary }
              }
            end)
          }
        }
      end

      return {
        h1 { key },
        md(module.description),
        links,
        notes(_ENV, module),
        snippets(_ENV, module)
      }
    end, lookup[key])
  end

  for _, key in ipairs(categories.objects) do
    content[key] = html(function(_ENV, object)
      local constructors, links

      if object.constructors then
        constructors = {
          h2 { 'Constructor' .. (#object.constructors > 1 and 's' or '') },
          table {
            imap(object.constructors, function(constructor)
              return tr {
                td { class = 'pre', constructor },
                td { lookup[constructor].summary }
              }
            end)
          }
        }
      else
        constructors = ''
      end

      if object.sections then
        links = imap(object.sections, function(section)
          return {
            h2 { section.name },
            section.description and md(section.description) or '',
            table {
              imap(tags[section.tag], function(link)
                return tr {
                  td { class = 'pre', link },
                  td { lookup[link].summary }
                }
              end)
            }
          }
        end)
      elseif object.methods and #object.methods > 0 then
        links = {
          h2 'Methods',
          table {
            imap(object.methods, function(method)
              return tr {
                td { class = 'pre', method.key },
                td { method.summary }
              }
            end)
          }
        }
      else
        links = ''
      end

      return {
        h1 { key },
        md(object.description),
        constructors,
        links,
        notes(_ENV, object),
        snippets(_ENV, object),
        related(_ENV, object)
      }
    end, lookup[key])
  end

  local function subtable(_ENV, fields, hasDefault, indent)
    if not fields then return end

    indent = indent or 0

    return imap(fields, function(field)
      return tr {
        class = 'indent-' .. indent,
        td { class = 'pre', (indent > 0 and '.' or '') .. field.name },
        td { class = { 'pre', field.type }, field.type },
        hasDefault and td { class = 'pre', field.default } or '',
        td { field.description and md(field.description):gsub('</?p>', '') or '' },
        subtable(_ENV, field.table, hasDefault, indent + 1)
      }
    end)
  end

  local function renderFn(_ENV, fn, key)
    return {
      h1 { key },
      md(fn.description),
      imap(fn.variants, function(variant)
        local args = '(' .. t.concat(imap(variant.arguments, function(arg) return arg.name end), ', ') .. ')'
        local rets = t.concat(imap(variant.returns, function(ret) return ret.name end), ', ')
        local signature, arguments, returns

        if fn.tag == 'callbacks' then
          signature = pre {
            code {
              'function ' .. key .. args .. '\n  -- your code here\nend'
            }
          }
        else
          signature = pre { code { class = 'nohighlight', rets .. (#rets > 0 and ' = ' or '') .. key .. args } }
        end

        if #variant.arguments > 0 then
          local hasDefault = false
          for _, arg in ipairs(variant.arguments) do
            if arg.default then
              hasDefault = true
              break
            elseif arg.table then
              for _, field in ipairs(arg.table) do
                if field.default then
                  hasDefault = true
                  break
                end
              end
            end
          end

          arguments = table {
            class = 'signature',
            thead { tr { td 'Name', td 'Type', hasDefault and (td 'Default') or '', td 'Description' } },
            tbody { subtable(_ENV, variant.arguments, hasDefault) }
          }
        else
          arguments = p { class = 'muted', 'None' }
        end

        if #variant.returns > 0 then
          returns = table {
            class = 'signature',
            thead { tr { td 'Name', td 'Type', td 'Description' } },
            tbody { subtable(_ENV, variant.returns, false) }
          }
        else
          returns = p { class = 'muted', 'Nothing' }
        end

        return {
          #fn.variants > 1 and hr({}) or '',
          variant.description and md(variant.description) or '',
          signature,
          h3 'Arguments',
          arguments,
          h3 'Returns',
          returns
        }
      end),
      notes(_ENV, fn),
      snippets(_ENV, fn),
      related(_ENV, fn)
    }
  end

  for _, key in ipairs(categories.functions) do
    content[key] = html(renderFn, lookup[key], key)
  end

  for _, key in ipairs(categories.callbacks) do
    content[key] = html(renderFn, lookup[key], key)
  end

  for _, key in ipairs(categories.types) do
    content[key] = html(function(_ENV, enum)
      return {
        h1 { key },
        md(enum.description),
        table {
          thead { tr { td 'Value', td 'Description' } },
          tbody {
            imap(enum.values, function(value)
              return tr {
                td { class = 'pre', value.name },
                td { value.description }
              }
            end)
          }
        },
        notes(_ENV, enum),
        snippets(_ENV, enum),
        related(_ENV, enum)
      }
    end, lookup[key])
  end

  -- Sidebar

  local versions = {}
  for name, kind in assert(unix.opendir('docs')) do
    if kind == unix.DT_DIR and not name:match('^%.') then
      table.insert(versions, name)
    end
  end

  table.sort(versions, function(a, b)
    if a:match('v%d') and b:match('v%d') then
      local ta = { a:match('(%d+)%.(%d+)%.(%d+)') }
      local tb = { b:match('(%d+)%.(%d+)%.(%d+)') }
      for i = 1, 3 do
        if tonumber(ta[i]) < tonumber(tb[i]) then return false
        elseif tonumber(ta[i]) > tonumber(tb[i]) then return true end
      end
      return false
    else
      return a < b
    end
  end)

  local sidebar = html(function(_ENV)
    local sections = { 'guides', 'examples', 'modules', 'objects', 'callbacks', 'functions', 'types' }
    local hide = { functions = true, types = true }

    local function link(key, group)
      local label = (key == 'Joint' or key == 'Shape') and (key .. 's') or key:gsub('.+/', ''):gsub('_', ' ')
      local hidden = key:match('^%w+Joint$') or key:match('^%w+Shape$') or key:match('Vec%d') or key:match('Mat%d') or key == 'Quat'
      local class = t.concat({ group = group, hidden and 'hidden' or '' }, ' ')

      return li {
        class = { group = group },
        a {
          ['data-key'] = key,
          class = { hidden = hidden },
          href = not group and ('/docs/%s/%s'):format(v, key),
          tabIndex = '0',
          label
        },
        group and (ul {
          imap(group, function(subkey)
            return link(subkey)
          end)
        }) or ''
      }
    end

    return {
      select {
        class = 'versions',
        onchange = 'window.location.href=this.options[this.selectedIndex].value',
        option { selected = 'selected', value = '/docs/' .. v, v },
        imap(versions, function(version)
          if version ~= v then
            return option { value = '/docs/' .. version, version }
          else
            return ''
          end
        end)
      },
      input { class = 'search', spellcheck = 'false' },
      aside { class = 'alias-message' },
      imap(sections, function(category)
        return {
          section {
            class = { category, hidden = hide[category] },
            h2(category:gsub('^%l', string.upper)),
            ul {
              imap(categories[category], function(key)
                return link(key, categories[category][key])
              end)
            }
          }
        }
      end)
    }
  end)

  -- Write static files

  local root = 'docs/' .. v

  assert(unix.rmrf(root))
  assert(unix.makedirs(root))
  assert(Barf(root .. '/data.json', EncodeJson(api)))
  assert(Barf(root .. '/pages.json', EncodeJson(content):gsub('\\u003c', '<'):gsub('\\u003e', '>') .. ''))

  local template = assert(Slurp('docs/.template.html'))

  for k, v in pairs(content) do
    if k:match('/') then
      assert(unix.makedirs(root .. '/' .. k:match('(.+)/')))
    end

    local title = k:gsub('(.+)/', ''):gsub('_', ' ')

    assert(Barf(root .. '/' .. k .. '.html', template:format(title, sidebar, k, v)))
  end
end
