<!--
category: reference
-->

lovr.graphics.newMesh
===

Creates a new mesh.  A mesh is a drawable object that stores an arbitrary list of points.  It
is flexible and efficient, but can be difficult to use.

Meshes contain a list of vertices and a "format" table for the vertices.  The format table is a
list of attributes describing what information is stored for each vertex.  Each attribute is a table
containing the name of the attribute, the data type, and the number of components in the attribute.
The data type can either be "float" or "byte".  The number of components can be from 1 to 4.  The
default format is as follows:

    {
      { 'lovrPosition', 'float', 3 },
      { 'lovrNormal', 'float', 3 },
      { 'lovrTexCoord', 'float', 2 }
    }

Each attribute is made available in the active shader as an input variable.

---

    mesh = lovr.graphics.newMesh(size, mode, usage)

### Arguments

- `number size` The maximum number of vertices the mesh can store.
- `MeshDrawMode mode (triangles)` The way the mesh will render the points.
- `MeshUsage usage (dynamic)` The usage hint for the mesh.

### Returns

- `Mesh mesh` The new mesh object.

---

    mesh = lovr.graphics.newMesh(vertices, mode, usage)

### Arguments

- `table vertices` A table of vertices.  Each vertex should be a table containing the data for the
  vertex.
- `MeshDrawMode mode (triangles)` The way the mesh will render the points.
- `MeshUsage usage (dynamic)` The usage hint for the mesh.

### Returns

- `Mesh mesh` The new mesh object.

---

    mesh = lovr.graphics.newMesh(format, size, mode, usage)

### Arguments

- `table format` A table describing the custom attribute format of the vertices.
- `number size` The maximum number of vertices the mesh can store.
- `MeshDrawMode mode (triangles)` The way the mesh will render the points.
- `MeshUsage usage (dynamic)` The usage hint for the mesh.

### Returns

- `Mesh mesh` The new mesh object.

---

    mesh = lovr.graphics.newMesh(format, vertices, mode, usage)

### Arguments

- `table format` A table describing the custom attribute format of the vertices.
- `table vertices` A table of vertices.  Each vertex should be a table containing the data for the
  vertex.
- `MeshDrawMode mode (triangles)` The way the mesh will render the points.
- `MeshUsage usage (dynamic)` The usage hint for the mesh.

### Returns

- `Mesh mesh` The new mesh object.
