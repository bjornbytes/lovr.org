local secrets = require 'secrets'
local generate = require 'generate'
local refresh = require 'refresh'
local defaultVersion = 'v0.15.0'
local defaultPage = 'Getting_Started'

function OnHttpRequest()
  local method, path = GetMethod(), GetPath():gsub('/$', '')

  if path == '/' then
    Route()
  elseif method == 'GET' and path == '/downloads' then
    Route(GetHost(), path .. '.html')
  elseif method == 'GET' and path:find('/docs') == 1 then
    local version, page = path:match('/docs/([^/]+)/?(.*)')

    if not version or (version ~= 'master' and not version:match('v%d+%.%d+%.%d+')) then
      version, page = defaultVersion, version and (version .. (page == '' and page or ('/' .. page)))
    end

    print(page)

    page = page ~= '' and page or defaultPage
    page = page:gsub('%%3[aA]', ':')

    return Route(GetHost(), ('docs/%s/%s.html'):format(version, page))
  elseif method == 'GET' and path:find('/api/data') == 1 then
    local version = path:match('/api/data/(.+)$') or defaultVersion
    return Route(GetHost(), 'docs/' .. version .. '/data.json')
  elseif method == 'GET' and path:find('/api/docs') == 1 then
    local version = path:match('/api/data/(.+)$') or defaultVersion
    return Route(GetHost(), 'docs/' .. version .. '/pages.json')
  elseif method == 'POST' and path == '/hook/docs' then
    local body = GetBody()
    local data = DecodeJson(body)

    if not data or GetHeader('Content-Type') ~= 'application/json' then
      return SetStatus(400)
    end

    if not IsLoopbackIp(GetRemoteAddr()) and GetHeader('X-Hub-Signature-256') ~= GetCryptoHash('SHA256', body, secrets.docs) then
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
ProgramRedirect(307, '/download/mac', '/f/LÖVR.dmg')
ProgramRedirect(307, '/download/linux', '/f/lovr-x86_64.AppImage')
ProgramRedirect(307, '/download/android', '/f/lovr.apk.zip')
ProgramRedirect(307, '/download/apk', '/f/lovr.apk.zip')
ProgramRedirect(307, '/download/nightly', '/f/lovr-nightly.zip')
ProgramRedirect(307, '/source', 'https://github.com/bjornbytes/lovr')
ProgramRedirect(307, '/twitter', 'https://twitter.com/bjornbytes')
ProgramRedirect(307, '/matrix', 'https://matrix.to/#/#lovr:matrix.org')
ProgramRedirect(307, '/mastodon', 'https://fosstodon.org/@lovr')
