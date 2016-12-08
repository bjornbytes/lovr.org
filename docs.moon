mde = require 'markdown_extra'
docs = {}
reference = {}

for file in lfs.dir 'docs'
  path = 'docs/' .. file
  if lfs.attributes(path, 'mode') == 'file'
    content, metadata = mde.from_file(path)
    key = metadata and metadata.key or path\match('([^%/]+)%.md$')
    docs[key] = content
    if metadata and metadata.category == 'reference'
      table.insert reference, key

table.sort reference, (a, b) ->
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

{ :docs, :reference }
