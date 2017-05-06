-- lua build-example.lua examples/MyExample

local name = arg[1]:match('/([^%.]+)$')
os.execute('python emscripten/tools/file_packager.py "static/play/' .. name .. '.data" --preload ' .. arg[1] .. '@/ --js-output="static/play/' .. name .. '.js"')

local file

file = io.open(arg[1] .. '/main.lua', 'r')
local code = file:read('*a'):gsub('%s+$', '')
file:close()

file = io.open(arg[1] .. '.md', 'r')
local text = file:read('*all')
file:close()

if text:match('<!%-%-%s*code%s*%-%->') then
  file = io.open(arg[1] .. '.md.compiled', 'w')
  file:write(true and text:gsub('<!%-%-%s*code%s*%-%->', '```\n' .. code .. '\n```'))
  file:close()
end
