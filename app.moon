import Application from require 'lapis'
import cached from require 'lapis.cache'
import getDocs from require 'docs'

config = require('lapis.config').get!

class extends Application
  layout: 'layout'

  @before_filter =>
    @prefix = config.prefix

  [index: "/"]: cached =>
    render: true

  [docs: "/docs(/*)"]: cached =>
    docs, reference = getDocs()
    @reference = reference
    @page = @params.splat or 'Introduction'
    @contents = docs[@page] or ''
    render: true

  "/api/docs": cached =>
    json: getDocs()
