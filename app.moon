import Application from require 'lapis'
import cached from require 'lapis.cache'
import capture_errors_json, yield_error from require 'lapis.application'

config = require('lapis.config').get!
glob = require 'glob'
lfs = require 'lfs'
zip = require 'brimworks.zip'

math.randomseed os.time!
import random from math

class extends Application
  layout: 'layout'

  handle_404: =>
    render: '400'

  handle_error: (err, trace) =>
    if config.env == 'prod'
      ngx.log ngx.ERR, err, trace
      render: '500'
    else
      super err, trace

  [index: '/']: cached =>
    render: true

  [docs: '/docs(/*)']: cached =>
    docs, categories = glob('docs')
    @reference = categories.reference
    @page = @params.splat or 'Introduction'
    @contents = docs[@page] or ''
    render: true

  [examples: '/examples(/*)']: cached =>
    examples, categories = glob 'examples', '%.md%.compiled$'

    @examples = categories.default
    @page = @params.splat
    @contents = examples[@page] or ''
    render: true

  [play: '/play/:id']: =>
    @id = @params.id
    render: true

  [embed: '/embed/:id']: =>
    @id = @params.id
    render: true

  [share: '/share']: =>
    render: true

  '/api/docs': cached =>
    json: glob 'docs'

  '/api/examples': cached =>
    json: glob 'examples', '%.md.compiled$'

  '/api/share': capture_errors_json =>
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

    zipName = os.tmpname!
    file = io.open(zipName, 'wb')
    file\write(@params.file.content)
    file\close!

    archive = zip.open(zipName)

    if not archive
      return yield_error 'unzip'

    if #archive > 1000
      return yield_error 'too many files'

    if not archive\name_locate('main.lua')
      return yield_error 'no main'

    unzipTo = "/tmp/#{id}"
    lfs.mkdir(unzipTo)

    totalSize = 0
    for i = 1, #archive
      stat = archive\stat(i)
      if not stat
        return yield_error 'unzip'

      if stat.name\match('^/')
        return yield_error 'absolute'

      totalSize += stat.size

      if totalSize > 25e6
        return yield_error 'too big'

      handle = archive\open(i)
      data = handle\read(stat.size)
      handle\close!

      file = io.open("#{unzipTo}/#{stat.name}", 'wb')
      file\write(data)
      file\close!

    os.execute("python emscripten/tools/file_packager.py static/play/#{id}.data --preload #{unzipTo}@/ --js-output=static/play/#{id}.js")
    os.remove(zipName)

    json: { :id }
