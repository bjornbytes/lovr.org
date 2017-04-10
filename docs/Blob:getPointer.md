<!--
category: reference
-->

Blob:getPointer
===

Returns a raw pointer to the Blob's data.  This can be used to interface with other C libraries
using the LuaJIT FFI.  Use this only if you know what you're doing!

    pointer = blob:getPointer()

### Arguments

None

### Returns

- `userdata pointer` A pointer to the data.
