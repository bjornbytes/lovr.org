lfs = require 'lfs'

refresh = (version) ->
  dir = "content/#{version}"

  if lfs.attributes(dir, 'mode') ~= 'directory'
    os.execute "git clone --depth=1 --branch=#{version} https://github.com/bjornbytes/lovr-docs #{dir}"
  else
    os.execute "git -C #{dir} pull"

  for file in lfs.dir "#{dir}/examples"
    path = "#{dir}/examples/#{file}"
    if not file\match('^%.') and lfs.attributes(path, 'mode') == 'directory'
      id = file .. version\gsub('%.', '')\gsub('master', '')
      os.execute("python emscripten/tools/file_packager.py static/play/#{id}.data --preload #{path}@/ --js-output=static/play/#{id}.js")

refresh
