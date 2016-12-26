lapis = require 'lapis'
import cached from require 'lapis.cache'
import getDocs from require 'docs'

class extends lapis.Application
  @enable 'etlua'
  layout: 'layout'

  @before_filter =>
    @prefix = '/lovr'

  [index: "/"]: cached =>
    render: true

  [docs: "/docs(/*)"]: cached =>
    docs, reference = getDocs()
    @reference = reference
    @page = @params.splat or 'Introduction'
    @content = docs[@page] or ''
    render: true

  "/api/docs": cached =>
    json: getDocs()
