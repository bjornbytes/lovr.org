<!--
category: reference
-->

Buffer:setVertexAttribute
===

Set the components of a specific attribute of a vertex in a Buffer.

    buffer:setVertexAttribute(vertex, attribute, ...)

### Arguments

- `number vertex` The index of the vertex.
- `number attribute` The index of the attribute.
- `...` The new components of the attribute.

### Returns

Nothing

Notes
---

Buffers without a custom format have the vertex position as their first attribute, the normal vector
as the second attribute, and the texture coordinate as the third attribute.

See also
---

- `Buffer:getVertexAttribute`
