<!--
category: reference
-->

lovr.filesystem.load
===

Load a file containing Lua code as a chunk.

    chunk = lovr.filesystem.load(filename)

### Arguments

- `string filename` The name of the file to load.

### Returns

- `function chunk` The runnable chunk.

Notes
---

An error is thrown if the file contains syntax errors.  You can use `pcall` to safely load the code:

```
local success, chunk = pcall(lovr.filesystem.load, filename)
if not success then
  print('Oh no! There was an error: ' .. tostring(chunk))
else
  local success, result = pcall(chunk)
  print(success, result)
end
```
