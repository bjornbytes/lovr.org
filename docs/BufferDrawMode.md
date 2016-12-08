<!--
category: reference
-->

BufferDrawMode
---

Buffers are lists of arbitrary vertices.  These vertices can be drawn in a few different ways,
leading to different results.

#### Values

- `points` Draw each vertex as a point.
- `strip` The first three vertices define a triangle.  Each vertex after that creates a triangle
  using the new vertex and last two vertices.
- `triangles` Each set of three vertices represents a discrete triangle.
- `fan` Draws a set of triangles.  Each one shares the first vertex as a common point, leading to a
  fan-like shape.
