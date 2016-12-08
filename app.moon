lapis = require 'lapis'
import docs, reference from require 'docs'
require 'lfs'

class extends lapis.Application
  @enable 'etlua'
  layout: 'layout'

  @before_filter =>
    @prefix = ''

  [index: "/"]: =>
    render: true

  [docs: "/docs(/*)"]: =>
    @reference = reference
    @page = @params.splat
    @content = docs[@page] or ''
    render: true

  "/api/docs": =>
    json: docs
