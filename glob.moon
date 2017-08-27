require 'lfs'
mde = require 'markdown_extra'

glob = ->
  data, categories  = {}, {}

  dir = 'docs'
  for file in lfs.dir dir
    path = dir .. '/' .. file
    if path\match('%.md$') and lfs.attributes(path, 'mode') == 'file'
      content, metadata = mde.from_file(path)
      key = metadata and metadata.key or path\match('([^%/]+)%.md$')
      data[key] = content
      category = metadata and metadata.category or 'default'
      categories[category] = categories[category] or {}
      table.insert categories[category], key


  dir = 'examples'
  categories.example = {}
  for file in lfs.dir 'examples' do
    path = dir .. '/' .. file
    if file ~= '.' and file ~= '..' and lfs.attributes(path, 'mode') == 'directory'
      main = path .. '/main.lua'
      handle = io.open(main, 'r')
      data[file] = '<pre><code>' .. handle\read('*a') .. '</code></pre>'
      handle\close!
      table.insert(categories.example, file)

  for category, keys in pairs categories do
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

  data, categories

glob
