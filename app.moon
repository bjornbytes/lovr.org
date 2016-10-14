lapis = require 'lapis'
mde = require 'markdown_extra'
require 'lfs'

class extends lapis.Application
  @enable 'etlua'
  layout: 'layout'

  docs = {}
  for file in lfs.dir 'docs'
    path = 'docs/' .. file
    if lfs.attributes(path, 'mode') == 'file'
      content, metadata = mde.from_file(path)
      key = metadata and metadata.key or path\match('([^%/]+)%.md$')
      docs[key] = content

  [index: "/"]: =>
    render: true

  [docs: "/api/docs"]: =>
    json: docs
