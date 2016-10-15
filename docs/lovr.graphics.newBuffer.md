lovr.graphics.newBuffer
---

Creates a new buffer.  A buffer is a drawable object that stores an arbitrary list of points.  It
is flexible and efficient, but can be difficult to use.

Buffers contain a list of vertices and a "format" table for the vertices.  The format table is a
list of attributes describing what information is stored for each vertex.  Each attribute is a table
containing the name of the attribute, the data type, and the number of components in the attribute.
The data type can either be "float" or "byte".  The number of components can be from 1 to 4.  The
default format is as follows:

    {
      { 'position', 'float', 3 },
      { 'normal', 'float', 3 },
      { 'texCoord', 'float', 2 }
    }

Each attribute is made available in the active shader as an input variable.

---

    buffer = lovr.graphics.newBuffer(size, mode, usage)

#### Arguments

- `number size` The maximum number of vertices the buffer can store.
- `BufferDrawMode mode (triangles)` The way the buffer will render the points.
- `BufferUsage usage (dynamic)` The usage hint for the buffer.

#### Returns

- `Buffer buffer` The new buffer object.

---

    buffer = lovr.graphics.newBuffer(vertices, mode, usage)

#### Arguments

- `table vertices` A table of vertices.  Each vertex should be a table containing three numbers
  representing the x, y, and z coordinates of the vertex.
- `BufferDrawMode mode (triangles)` The way the buffer will render the points.
- `BufferUsage usage (dynamic)` The usage hint for the buffer.

#### Returns

- `Buffer buffer` The new buffer object.

---

    buffer = lovr.graphics.newBuffer(format, size, mode, usage)

#### Arguments

- `table format` A table describing the custom attribute format of the vertices.
- `number size` The maximum number of vertices the buffer can store.
- `BufferDrawMode mode (triangles)` The way the buffer will render the points.
- `BufferUsage usage (dynamic)` The usage hint for the buffer.

#### Returns

- `Buffer buffer` The new buffer object.

---

    buffer = lovr.graphics.newBuffer(format, vertices, mode, usage)

#### Arguments

- `table format` A table describing the custom attribute format of the vertices.
- `table vertices` A table of vertices.  Each vertex should be a table containing three numbers
  representing the x, y, and z coordinates of the vertex.
- `BufferDrawMode mode (triangles)` The way the buffer will render the points.
- `BufferUsage usage (dynamic)` The usage hint for the buffer.

#### Returns

- `Buffer buffer` The new buffer object.
