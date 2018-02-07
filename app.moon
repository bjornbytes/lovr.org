import Application from require 'lapis'
import cached from require 'lapis.cache'
import capture_errors_json, yield_error, respond_to, json_params from require 'lapis.application'

config = require('lapis.config').get!
glob = require 'glob'
upload = require 'upload'
lfs = require 'lfs'
aliases = require 'aliases'
refresh = require 'content.refresh'

isVersion = (v) -> v and (v\match('%d%.+') or v == 'master')

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

  [docs: '/docs(/:version)(/:page)']: cached =>
    { version: @version, page: @page } = @params
    @version, @page = nil, @version if not isVersion(@version)
    docs, @categories = glob @version
    return render: '404', status: 404 if not docs or (@page and not docs[@page])
    @page or= @categories.guides[1]
    @contents = docs[@page]
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

  '/api/docs(/:version)': cached =>
    docs = glob @params.version
    return status: 404, layout: false, '' if not docs
    json: docs

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
      return status: 200, layout: false, '' if not @params.version and not @params.ref
      success = pcall refresh, @params.version or (@params.ref and @params.ref\match('[^/]+$'))
      status: success and 200 or 500, layout: false, ''
  }
