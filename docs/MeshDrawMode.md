<!--
category: reference
-->

MeshDrawMode
===

Meshes are lists of arbitrary vertices.  These vertices can be drawn in a few different ways,
leading to different results.

Values
---

- `points` Draw each vertex as a point.
- `lines` The vertices represent a list of line segments.  Each pair of vertices will have a line
  drawn between them.
- `linestrip` The first two vertices have a line drawn between them, and each vertex after that will
  be connected to the previous vertex with a line.
- `strip` The first three vertices define a triangle.  Each vertex after that creates a triangle
  using the new vertex and last two vertices.
- `triangles` Each set of three vertices represents a discrete triangle.
- `fan` Draws a set of triangles.  Each one shares the first vertex as a common point, leading to a
  fan-like shape.
