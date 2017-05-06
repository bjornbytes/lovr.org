require 'lfs'
mde = require 'markdown_extra'

glob = (dir, ext = '%.md$', fn) ->
  data, categories = {}, { all: {} }

  for file in lfs.dir dir
    path = dir .. '/' .. file
    if path\match(ext) and lfs.attributes(path, 'mode') == 'file'
      content, metadata = mde.from_file(path)
      key = metadata and metadata.key or path\match('([^%/]+)' .. ext)
      data[key] = fn and fn(content, metadata, key) or content
      category = metadata and metadata.category or 'default'
      categories[category] = categories[category] or {}
      table.insert categories[category], key

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
