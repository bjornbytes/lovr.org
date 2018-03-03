import Application from require 'lapis'
import cached from require 'lapis.cache'
import capture_errors_json, yield_error, respond_to, json_params from require 'lapis.application'
import hmac_sha1 from require 'lapis.util.encoding'

config = require('lapis.config').get!
cache = require 'lapis.cache'
glob = require 'glob'
upload = require 'upload'
lfs = require 'lfs'
aliases = require 'aliases'
secrets = require 'secrets'
refresh = require 'content.refresh'

isVersion = (v) -> v and (v\match('%d%.+') or v == 'master')
status = (status) -> { status: status, layout: false, '' }

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
    return status 404 if not docs
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

  '/docs/WebVR': =>
    redirect_to: 'https://lovr.org/docs/Distribution'

  '/refresh/:version': respond_to {
    POST: json_params =>
      return status 403 if @req.parsed_url.host ~= 'localhost' and @req.parsed_url.host ~= '127.0.0.1'
      return status 400 if not @params.version or not isVersion @params.version
      success = pcall refresh, @params.version
      return status 500 if not success
      cache.delete_all!
      status 200
  }

  '/refresh': respond_to {
    POST: json_params =>
      fail = (status) -> { status: status, layout: false, '' }
      return status 400 if not @params.ref
      version = @params.ref\match('[^/]+$')
      return status 400 if not isVersion version
      ngx.req.read_body!
      data = ngx.req.get_body_data!
      return status 400 if not data
      signature = pcall -> 'sha1=' .. hmac_sha1(secrets.webhook, data)
      return status 403 if signature ~= @req.headers['X-Hub-Signature']
      success = pcall refresh, version
      return status 500 if not success
      cache.delete_all!
      status 200
  }
