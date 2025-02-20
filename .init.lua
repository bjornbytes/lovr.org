local secrets = require 'secrets'
local generate = require 'generate'
local refresh = require 'refresh'

local defaultVersion = 'v0.18.0'

function OnHttpRequest()
  local method, path = GetMethod(), GetPath():gsub('/$', '')

  if path == '' then
    Route()
  elseif path:match('%.js$') or path:match('%.wasm$') then
    if ServeAsset(path:gsub('static/', '')) then
      SetHeader('Access-Control-Allow-Origin', '*')
    else
      ServeError(404)
    end
  elseif path:match('static/img') or path:match('static/f') then
    return ServeAsset(path:gsub('static/', '')) or ServeError(404)
  elseif method == 'GET' and path == '/downloads' then
    ServeAsset(path .. '.html')
  elseif method == 'GET' and path:find('/docs') == 1 then
    local version, page = path:gsub('%%3[aA]', ':'):match('/docs/([^/]+)(/?.*)')

    if not version then
      version, page = defaultVersion, 'Getting_Started'
    elseif not version:match('v%d+%.%d+%.%d+') and version ~= 'dev' then
      version, page = defaultVersion, version .. page
    elseif page == '' or page == '/' then
      page = 'index'
    end

    return ServeAsset(('docs/%s/%s.html'):format(version, page)) or ServeError(404)
  elseif method == 'GET' and path:find('/api/data') == 1 then
    local version = path:match('/api/data/(.+)$') or defaultVersion
    return ServeAsset(('docs/%s/data.json'):format(version)) or ServeError(404)
  elseif method == 'GET' and path:find('/api/docs') == 1 then
    local version = path:match('/api/docs/(.+)$') or defaultVersion
    return ServeAsset(('docs/%s/content.json'):format(version)) or ServeError(404)
  elseif method == 'GET' and path:find('/api/pages') == 1 then
    return ServeAsset('docs/pages.json') or ServeError(404)
  elseif method == 'POST' and path == '/refresh' then
    local body = GetBody()
    local data = DecodeJson(body)

    if not data or GetHeader('Content-Type') ~= 'application/json' then
      return SetStatus(400)
    end

    local hash = 'sha256='
    local bytes = GetCryptoHash('SHA256', body, secrets.docs)
    for i = 1, #bytes do
      hash = hash .. ('%02x'):format(bytes:byte(i))
    end

    if not IsLoopbackIp(GetRemoteAddr()) and GetHeader('X-Hub-Signature-256') ~= hash then
      return SetStatus(403)
    end

    local version = data.ref and data.ref:match('[^/]+$')

    if not version then
      return SetStatus(400)
    end

    if assert(unix.fork()) == 0 then
      refresh(version)
    else
      unix.wait()
      generate(version)
      SetStatus(200)
    end
  else
    Route()
  end
end

ProgramRedirect(307, '/download', '/f/lovr.zip')
ProgramRedirect(307, '/download/windows', '/f/lovr.zip')
ProgramRedirect(307, '/download/mac', '/f/lovr.app.zip')
ProgramRedirect(307, '/download/linux', '/f/lovr-x86_64.AppImage')
ProgramRedirect(307, '/download/android', '/f/lovr.apk.zip')
ProgramRedirect(307, '/download/apk', '/f/lovr.apk.zip')
ProgramRedirect(307, '/source', 'https://github.com/bjornbytes/lovr')
ProgramRedirect(307, '/twitter', 'https://twitter.com/bjornbytes')
ProgramRedirect(307, '/mastodon', 'https://fosstodon.org/@lovr')
ProgramRedirect(307, '/matrix', 'https://matrix.to/#/#community:lovr.org')
ProgramRedirect(307, '/discord', 'https://discord.gg/qWDH6MbD2B')
