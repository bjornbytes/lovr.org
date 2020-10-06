lfs = require 'lfs'
config = require('lapis.config').get!

refresh = (version) ->
  dir = "content/#{version}"

  if lfs.attributes(dir, 'mode') ~= 'directory'
    os.execute "git clone --depth=1 --branch=#{version} https://github.com/bjornbytes/lovr-docs #{dir}"
  else
    os.execute "git -C #{dir} pull"

  return unless version == config.version

  for file in lfs.dir "#{dir}/showcase"
    path = "#{dir}/showcase/#{file}"
    if not file\match('^%.') and lfs.attributes(path, 'mode') == 'directory'
      os.execute("(cd #{path} && zip -0qFSr ../../../../static/f/#{file}.zip .)")

  for category in lfs.dir "#{dir}/examples"
    if lfs.attributes("#{dir}/examples/#{category}", 'mode') == 'directory'
      os.execute("mkdir -p static/f/#{category}")
      for file in lfs.dir "#{dir}/examples/#{category}"
        path = "#{dir}/examples/#{category}/#{file}"
        if not file\match('^%.') and lfs.attributes(path, 'mode') == 'directory'
          os.execute("(cd #{path} && zip -0qFSr ../../../../../static/f/#{category}/#{file}.zip .)")

refresh
