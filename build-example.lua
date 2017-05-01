-- lua build-example.lua examples/Example_Name.md

local markdown = require 'markdown_extra'

local name = arg[1]:match('/([^%.]+)%.md$')
local dir = '/tmp/lovr-example'
lfs.mkdir(dir)

local file = io.open(dir .. '/main.lua', 'w')

local content, metadata = markdown.from_file(arg[1])

if not metadata then
  print('Unable to parse file')
  os.exit(1)
end

file:write(metadata.code)
file:close()

os.execute('python emscripten/tools/file_packager.py "static/play/' .. name .. '.data" --preload ' .. dir .. '@/ --js-output="static/play/' .. name .. '.js"')

os.remove(dir .. '/main.lua')
os.remove(dir)
