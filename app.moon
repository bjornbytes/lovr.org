import Application from require 'lapis'
import cached from require 'lapis.cache'
import capture_errors_json, yield_error from require 'lapis.application'

config = require('lapis.config').get!
glob = require 'glob'
upload = require 'upload'
lfs = require 'lfs'
aliases = require 'aliases'

class extends Application
  layout: 'layout'

  handle_404: =>
    render: '404', status: 404

  handle_error: (err, trace) =>
    if config.env == 'prod'
      ngx.log ngx.ERR, err, trace
      render: '500', status: 500
    else
      super err, trace

  [index: '/']: cached =>
    render: true

  [docs: '/docs(/*)']: cached =>
    docs, @categories = glob!
    @page = @params.splat or 'Getting_Started'
    @contents = docs[@page] or ''
    render: true

  [play: '/play/:id']: =>
    @id = @params.id
    render: true

  [embed: '/embed/:id']: =>
    if (not @params.id\match '^%w+$') or (not lfs.attributes("static/play/#{@params.id}.js", 'mode'))
      return status: 404

    @id = @params.id
    lfs.touch "static/play/#{@id}.js"
    render: true

  [share: '/share']: =>
    render: true

  '/api/docs': cached =>
    json: glob!

  '/api/aliases': cached =>
    json: aliases

  '/api/share': capture_errors_json =>
    success, result = pcall(upload, @params.file.content)
    if success
      return json: { id: result }
    else
      yield_error(result)

  '/download': =>
    redirect_to: 'http://bjornbyt.es/f/lovr.zip'

  '/repo': =>
    redirect_to: 'https://github.com/bjornbytes/lovr'

  '/source': =>
    redirect_to: 'https://github.com/bjornbytes/lovr'

  '/github': =>
    redirect_to: 'https://github.com/bjornbytes/lovr'

  '/slack': =>
    redirect_to: 'https://join.slack.com/ifyouwannabemylovr/shared_invite/MTc5ODk2MjE0NDM3LTE0OTQxMTIyMDEtMzdhOGVlODFhYg'
