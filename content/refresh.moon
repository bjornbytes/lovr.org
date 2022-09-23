lfs = require 'lfs'
config = require('lapis.config').get!

refresh = (version) ->
  dir = "content/#{version}"

  if lfs.attributes(dir, 'mode') ~= 'directory'
    os.execute "git clone --depth=1 --branch=#{version} https://github.com/bjornbytes/lovr-docs #{dir}"
  else
    os.execute "git -C #{dir} pull"

refresh
