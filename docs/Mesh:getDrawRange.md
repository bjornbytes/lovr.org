<!--
category: reference
-->

Mesh:getDrawRange
===

Retrieve the current draw range for the mesh.  The draw range is a subset of the vertices of the
mesh that will be drawn.

    start, count = mesh:getDrawRange()

### Arguments

None

### Returns

- `number start` The index of the first vertex that will be drawn, or `nil` if no draw range is set.
- `number count` The number of vertices that will be drawn, or `nil` if no draw range is set.
