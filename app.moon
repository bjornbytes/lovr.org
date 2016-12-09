lapis = require 'lapis'
import docs, reference from require 'docs'

class extends lapis.Application
  @enable 'etlua'
  layout: 'layout'

  @before_filter =>
    @prefix = '/lovr'

  [index: "/"]: =>
    render: true

  [docs: "/docs(/*)"]: =>
    @reference = reference
    @page = @params.splat or 'Introduction'
    @content = docs[@page] or ''
    render: true

  "/api/docs": =>
    json: docs
