require 'lfs'
mde = require 'markdown_extra'
import render_html from require 'lapis.html'
api = require 'content.lovr-api.raw'

glob = ->
  data = {}
  content = {}
  categories = {}
  tags = {}

  renderModule = =>
    render_html ->
      h1 @key
      raw mde.from_string @description

      if @sections
        for section in *@sections
          h2 section.name
          raw mde.from_string section.description

          if section.tag and tags[section.tag] and #tags[section.tag] > 0
            element 'table', ->
              for key in *tags[section.tag]
                tr ->
                  td class: 'pre', key
                  td data[key].summary
      else
        if @functions and #@functions > 0
          h2 'Functions'
          element 'table', ->
            for fn in *@functions
              tr ->
                td class: 'pre', fn.key
                td fn.summary

  renderFunction = =>
    render_html ->
      h1 @key
      raw mde.from_string @description

      for i, variant in ipairs(@variants)
        p variant.description if variant.description

        pre ->
          code ->
            returns = table.concat([ ret.name for ret in *variant.returns ], ', ')

            arguments = '(' .. table.concat([ arg.name for arg in *variant.arguments ], ', ') .. ')'

            if @tag == 'callbacks'
              raw 'function ' .. @key .. arguments .. '\n  --\nend'
            else
              returns ..= ' = ' if #returns > 0
              raw returns .. @key .. arguments

        h3 'Arguments'

        if #variant.arguments > 0
          element 'table', ->
            thead ->
              tr ->
                td 'Name'
                td 'Type'
                td 'Default'
                td 'Description'
            tbody ->
              for arg in *variant.arguments
                tr ->
                  td class: 'pre', arg.name
                  td class: 'pre', arg.type
                  td class: 'pre', arg.default
                  td arg.description
        else
          p 'None'

        h3 'Returns'

        if #variant.returns > 0
          element 'table', ->
            thead ->
              tr ->
                td 'Name'
                td 'Type'
                td 'Description'
            tbody ->
              for ret in *variant.returns
                tr ->
                  td class: 'pre', ret.name
                  td class: 'pre', ret.type
                  td ret.description
        else
          p 'Nothing'

        hr! if i ~= #@variants

      if @notes
        h2 'Notes'
        raw mde.from_string @notes

      if @examples
        h2 #@examples == 1 and 'Example' or 'Examples'
        for example in *@examples
          raw mde.from_string example.description if example.description

          pre ->
            code example.code

      if @related
        h2 'See also'
        ul ->
          for key in *@related
            li ->
              code key

  renderObject = =>
    render_html ->
      h1 @key
      raw mde.from_string @description

      if @constructors
        h2 #@constructors == 1 and 'Constructor' or 'Constructors'
        element 'table', ->
          for constructor in *@constructors
            tr ->
              td class: 'pre', constructor
              td data[constructor].summary

      if @sections
        for section in *@sections
          h2 section.name
          raw mde.from_string section.description

          if section.tag and tags[section.tag] and #tags[section.tag] > 0
            element 'table', ->
              for key in *tags[section.tag]
                tr ->
                  td class: 'pre', key
                  td data[key].summary
      else
        if @methods and #@methods > 0
          h2 'Methods'
          element 'table', ->
            for fn in *@methods
              tr ->
                td class: 'pre', fn.key
                td fn.summary

      if @notes
        h2 'Notes'
        raw mde.from_string @notes

      if @examples
        h2 #@examples == 1 and 'Example' or 'Examples'
        for example in *@examples
          raw mde.from_string example.description if example.description

          pre ->
            code example.code

      if @related
        h2 'See also'
        ul ->
          for key in *@related
            li ->
              code key

  renderEnum = =>
    render_html ->
      h1 @key
      raw mde.from_string @description

      element 'table', ->
        thead ->
          tr ->
            td 'Value'
            td 'Description'

        tbody ->
          for value in *@values
            tr ->
              td class: 'pre', value.name
              td value.description

  dir = 'examples'
  categories.example = {}
  for file in lfs.dir 'examples' do
    path = dir .. '/' .. file
    if file ~= '.' and file ~= '..' and lfs.attributes(path, 'mode') == 'directory'
      main = path .. '/main.lua'
      handle = io.open(main, 'r')
      if handle
        content[file] = '<pre><code>' .. handle\read('*a') .. '</code></pre>'
        handle\close!
        table.insert(categories.example, file)

  add = (item, category) ->
    { :key, :tag } = item
    data[key] = item
    tag = tag or 'none'
    tags[tag] = tags[tag] or {}
    table.insert(tags[tag], item.key)
    category ..= 's'
    categories[category] = categories[category] or {}
    table.insert(categories[category], item.key)

  addObject = (object) ->
    add object, 'object'
    add fn, 'function' for fn in *object.methods

  addModule = (m) ->
    add m, 'module'
    add fn, 'function' for fn in *m.functions
    add enum, 'enum' for enum in *m.enums
    addObject object for object in *m.objects

  addModule m for m in *api.modules
  add cb, 'callback' for cb in *api.callbacks

  for tag in pairs tags
    table.sort tags[tag], (a, b) ->
      aBase = a\gsub('%.[gs]et', '')\gsub('%.is', '')
      bBase = b\gsub('%.[gs]et', '')\gsub('%.is', '')
      return aBase == bBase and (a < b) or (aBase < bBase)

  content[key] = renderModule data[key] for key in *categories.modules
  content[key] = renderFunction data[key] for key in *categories.callbacks
  content[key] = renderFunction data[key] for key in *categories.functions
  content[key] = renderObject data[key] for key in *categories.objects
  content[key] = renderEnum data[key] for key in *categories.enums

  for category, keys in pairs categories
    table.sort keys, (a, b) ->
      aCap = (a\find('[A-Z]') == 1)
      bCap = (b\find('[A-Z]') == 1)
      if aCap and not bCap
        return a > b
      elseif bCap and not aCap
        return a > b
      elseif bCap and aCap
        return a < b
      else
        return a < b

  content, categories

glob
