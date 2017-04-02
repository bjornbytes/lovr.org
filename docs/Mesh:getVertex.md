<!--
category: reference
-->

Mesh:getVertex
===

Returns a single vertex in the mesh.

    ... = mesh:getVertex(index)

### Arguments

- `number index` The index of the vertex to retrieve.

### Returns

- `number ...` All attributes of the vertex.  For the default vertex format, 8 numbers will be
  returned, representing the position, normal, and texture coordinate of the vertex, respectively.
