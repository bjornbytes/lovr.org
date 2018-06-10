lfs = require 'lfs'
config = require('lapis.config').get!

refresh = (version) ->
  dir = "content/#{version}"

  if lfs.attributes(dir, 'mode') ~= 'directory'
    os.execute "git clone --depth=1 --branch=#{version} https://github.com/bjornbytes/lovr-docs #{dir}"
  else
    os.execute "git -C #{dir} pull"

  return unless version == config.version

  for file in lfs.dir "#{dir}/examples"
    path = "#{dir}/examples/#{file}"
    if not file\match('^%.') and lfs.attributes(path, 'mode') == 'directory'
      os.execute("python emscripten/tools/file_packager.py static/play/#{file}.data --no-heap-copy --preload #{path}@/#{file} --js-output=static/play/#{file}.js")

refresh
