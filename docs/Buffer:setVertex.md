<!--
category: reference
-->

Buffer:setVertex
===

Set a vertex of a Buffer.

---

    buffer:setVertex(index, ...)

### Arguments

- `number index` The index of the vertex to set.
- `...` The attributes of the vertex as arguments.

---

    buffer:setVertex(index, vertex)

### Arguments

- `number index` The index of the vertex to set.
- `table vertex` A table containing the attributes of the vertex.

### Returns

Nothing

Notes
---

Any unspecified components will be set to 0 for float and int attributes, or 255 for byte
attributes.

Example
---

Set the position of a vertex

    function lovr.load()
      buffer = lovr.graphics.newBuffer({
        { -1, 1, 0,  0, 0, 1,  0, 0 },
        { 1, 1, 0,  0, 0, 1,  1, 0 },
        { -1, -1, 0,  0, 0, 1,  0, 1 },
        { 1, -1, 0,  0, 0, 1,  1, 1 }
      }, 'strip')

      buffer:setVertex(2, { 7, 7, 7 })
      print(buffer:getVertex(2)) -- 7, 7, 7, 0, 0, 0, 0, 0
    end
