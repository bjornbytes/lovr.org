import Application from require 'lapis'
import cached from require 'lapis.cache'
import capture_errors_json, yield_error, respond_to, json_params from require 'lapis.application'
import hmac_sha1, encode_base64 from require 'lapis.util.encoding'

config = require('lapis.config').get!
cache = require 'lapis.cache'
glob = require 'glob'
lfs = require 'lfs'
secrets = require 'secrets'
refresh = require 'content.refresh'
versions = require 'content.versions'

status = (status) -> { status: status, layout: false, '' }
findPage = (docs, page) -> ([key for key in pairs docs when key\lower! == page\lower!])[1] or page

class extends Application
  @enable "etlua"
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
    render: true, layout: false

  [docs: '/docs(/:version)(/:page)']: cached =>
    { version: @version, page: @page } = @params
    @versions = versions!
    @version, @page = config.version, @version if not @versions[@version]
    @isDefaultVersion = @version == config.version
    docs, @categories = glob @version
    @page = @page\gsub('%%3A', ':') if @page
    @page = findPage docs, @page if docs and @page and not docs[@page]
    return render: '404', status: 404 if not docs or (@page and not docs[@page])
    @page or= @categories.guides[1]
    @contents = docs[@page]
    render: true

  [embed: '/embed']: =>
    render: true

  '/api/data(/:version)': =>
    version = @params.version or config.version
    api = glob version, true
    return status 404 if not api
    json: api

  '/api/docs(/:version)': =>
    version = @params.version or config.version
    docs = glob version
    return status 404 if not docs
    json: docs

  [downloads: '/downloads']: => render: true
  '/download': => redirect_to: '/static/f/lovr.zip'
  '/download/mac': => redirect_to: '/static/f/mac/LÖVR.dmg'
  '/download/windows': => redirect_to: '/static/f/win/32/lovr.zip'
  '/download/windows/32': => redirect_to: '/static/f/win/32/lovr.zip'
  '/download/windows/64': => redirect_to: '/static/f/win/64/lovr.zip'
  '/download/nightly': => redirect_to: '/static/f/lovr-nightly.zip'

  '/repo': =>
    redirect_to: 'https://github.com/bjornbytes/lovr'

  '/source': =>
    redirect_to: 'https://github.com/bjornbytes/lovr'

  '/github': =>
    redirect_to: 'https://github.com/bjornbytes/lovr'

  '/slack': =>
    redirect_to: 'https://join.slack.com/ifyouwannabemylovr/shared_invite/MTc5ODk2MjE0NDM3LTE0OTQxMTIyMDEtMzdhOGVlODFhYg'

  '/matrix': =>
    redirect_to: 'https://matrix.to/#/!XVAslexgYDYQnYnZBP:matrix.org'

  '/twitter': =>
    redirect_to: 'https://twitter.com/bjornbytes'

  '/docs/WebVR': =>
    redirect_to: 'https://lovr.org/docs/Distribution'

  '/sitemap': =>
    sitemap = { 'https://lovr.org', 'https://lovr.org/docs' }
    add = (path) -> table.insert sitemap, "https://lovr.org/docs/#{path}"
    _, categories = glob config.version
    add key for key in *categories.guides
    add key for key in *categories.examples
    add key for key in *categories.modules
    add key for key in *categories.callbacks
    add key for key in *categories.functions
    add key for key in *categories.types
    @options.layout = false
    @options.content_type = 'text/plain'
    table.concat sitemap, '\n'

  '/refresh/:version': respond_to {
    POST: json_params =>
      return status 403 if @req.parsed_url.host ~= 'localhost' and @req.parsed_url.host ~= '127.0.0.1'
      return status 400 if not @params.version
      success = pcall refresh, @params.version
      return status 500 if not success
      cachedContent[@params.version] = nil
      cache.delete_all!
      status 200
  }

  '/refresh': respond_to {
    POST: json_params =>
      return status 400 if not @params.ref
      version = @params.ref\match('[^/]+$')
      return status 400 if not version
      ngx.req.read_body!
      data = ngx.req.get_body_data!
      return status 400 if not data
      digest = hmac_sha1(secrets.webhook, data)
      signature = 'sha1='
      signature ..= string.format('%02x', digest\byte(i)) for i = 1, #digest
      return status 403 if signature ~= @req.headers['X-Hub-Signature']
      success = pcall refresh, version
      return status 500 if not success
      cachedContent[version] = nil
      cache.delete_all!
      status 200
  }

  '/nightly': respond_to {
    GET: =>
      redirect_to: '/static/f/lovr-nightly.zip'

    POST: json_params =>
      return status 403 if @req.headers['Authorization'] != "Basic #{encode_base64(secrets.nightly)}"
      return status 400 if not @params.artifacts or #@params.artifacts == 0
      return status 400 if @params.artifacts[1].fileName ~= 'lovr.zip'
      os.execute("curl '#{@params.artifacts[1].url}' > static/f/lovr-nightly.zip") -- >_>
      status 200
  }
