<!--
category: module
-->

json
===

The json module exposes functions for encoding and decoding JSON.  You can use it by requiring the
`json` module.

Example
---

```
local json = require 'json'
local data = { health = 10, position = { 1, 2, 3 } }
local encoded = json.encode(data)
print(encoded)
local decoded = json.decode(encoded)
print(decoded.health, unpack(decoded.position))
```
