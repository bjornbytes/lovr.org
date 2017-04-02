<!--
category: reference
-->

Mesh:setVertex
===

Set a vertex of a Mesh.

---

    mesh:setVertex(index, ...)

### Arguments

- `number index` The index of the vertex to set.
- `...` The attributes of the vertex as arguments.

---

    mesh:setVertex(index, vertex)

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
      mesh = lovr.graphics.newMesh({
        { -1, 1, 0,  0, 0, 1,  0, 0 },
        { 1, 1, 0,  0, 0, 1,  1, 0 },
        { -1, -1, 0,  0, 0, 1,  0, 1 },
        { 1, -1, 0,  0, 0, 1,  1, 1 }
      }, 'strip')

      mesh:setVertex(2, { 7, 7, 7 })
      print(mesh:getVertex(2)) -- 7, 7, 7, 0, 0, 0, 0, 0
    end
