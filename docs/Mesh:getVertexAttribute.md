<!--
category: reference
-->

Mesh:getVertexAttribute
===

Get the components of a specific attribute of a vertex in a Mesh.

    ... = mesh:getVertexAttribute(vertex, attribute)

### Arguments

- `number vertex` The index of the vertex to retrieve the attribute of.
- `number attribute` The index of the attribute to retrieve the components of.

### Returns

- `...` The components of the attribute of the vertex.

Notes
---

Meshes without a custom format have the vertex position as their first attribute, the normal vector
as the second attribute, and the texture coordinate as the third attribute.

See also
---

- `Mesh:setVertexAttribute`
