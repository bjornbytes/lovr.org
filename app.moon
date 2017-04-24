import Application from require 'lapis'
import cached from require 'lapis.cache'

config = require('lapis.config').get!
glob = require 'glob'
lfs = require 'lfs'

math.randomseed os.time!
import random from math

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

  [play: '/play/:id[A-Za-z%d]']: =>
    @id = @params.id
    render: true

  [share: '/share']: =>
    render: true

  '/api/docs': cached =>
    json: glob('docs')

  '/api/share': =>
    uuid = ->
      randomCharacter = ->
        switch random 1, 3
          when 1 random 65, 90
          when 2 random 97, 122
          when 3 random 48, 57

      string.char unpack [ randomCharacter! for i = 1, 6 ]

    id = uuid!
    while lfs.attributes("static/play/#{id}", 'mode') do
      id = uuid!

    file = io.open("uploads/#{id}.zip", 'wb')
    file\write(@params.file.content)
    file\close!

    os.execute("unzip -q -o uploads/#{id}.zip -d uploads/#{id}")
    os.execute("python emscripten/tools/file_packager.py static/play/#{id}.data --preload uploads/#{id}@/ --js-output=static/play/#{id}.js")
    os.remove("uploads/#{id}.zip")

    json: { :id }
