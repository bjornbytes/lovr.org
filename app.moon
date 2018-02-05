import Application from require 'lapis'
import cached from require 'lapis.cache'
import capture_errors_json, yield_error, respond_to, json_params from require 'lapis.application'

if not package.path\match('%./?/init%.lua')
  package.path = package.path .. ';./?/init.lua'

config = require('lapis.config').get!
glob = require 'glob'
upload = require 'upload'
lfs = require 'lfs'
aliases = require 'aliases'
refresh = require 'content.refresh'

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

  [docs: '/docs(/:version[v%d%.])(/*)']: cached =>
    docs, @categories = glob @params.version
    @page = @params.splat or @categories.guides[1]
    @contents = docs[@page] or ''
    render: true

  [play: '/play/:id']: =>
    @id = @params.id
    render: true

  [embed: '/embed/:id']: =>
    @id = @params.id
    @file = "static/play/#{@id}.js"

    if (not @id\match '^%w+$') or not lfs.attributes(@file, 'mode')
      return status: 404

    lfs.touch @file
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

  '/refresh(/:version)': respond_to {
    POST: json_params =>
      success = pcall refresh, @params.version or (@params.ref and @params.ref\match('[^/]+$'))
      status: success and 200 or 500, layout: false, ''
  }
