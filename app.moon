import Application from require 'lapis'
import cached from require 'lapis.cache'

config = require('lapis.config').get!
glob = require 'glob'

class extends Application
  layout: 'layout'

  @before_filter =>
    @prefix = config.prefix

  [index: '/']: cached =>
    render: true

  [docs: '/docs(/*)']: cached =>
    docs, categories = glob('docs')
    @reference = categories.reference
    @page = @params.splat or 'Introduction'
    @contents = docs[@page] or ''
    render: true

  [examples: '/examples(/*)']: cached =>
    examples, categories = glob('examples')
    @page = @params.splat
    @contents = examples[@page] or ''
    render: true

  "/api/docs": cached =>
    json: glob('docs')
