<!--
category: reference
-->

Mesh:setVertexMap
===

Sets the vertex map.  The vertex map is a list of indices in the mesh, allowing the reordering or
reuse of vertices.

    mesh:setVertexMap(map)

### Arguments

- `table map` The new vertex map.  Each element of the table is an index of a vertex.

### Returns

Nothing
