<!--
category: reference
-->

Mesh:drawInstanced
===

Draw a Mesh multiple times.  This is much faster than calling `Mesh:draw` more than once.

    mesh:drawInstanced(instances, x, y, z, scale, angle, ax, ay, az)

### Arguments

- `number instances (1)` The number of copies of the mesh to draw.
- `number x (0)` The x coordinate to translate the vertices by.
- `number y (0)` The y coordinate to translate the vertices by.
- `number z (0)` The z coordinate to translate the vertices by.
- `number scale (1)` The amount to scale the vertex positions by.
- `number angle (0)` The number of radians to rotate the vertices around their axis of rotation.
- `number ax (0)` The x component of the axis of rotation.
- `number ay (1)` The y component of the axis of rotation.
- `number az (0)` The z component of the axis of rotation.

### Returns

Nothing

---

Draws multiple copies of the Mesh at the given transform location.

    mesh:drawInstanced(instances, transform)

### Arguments

- `number instances (1)` The number of copies of the mesh to draw.
- `Transform transform` The Transform to apply to the vertices.

### Returns

Nothing

Notes
---

By default, the Meshes will all be drawn on top of each other.  To get the drawn copies to appear in
different places, you can use the `gl_InstanceID` variable in a `Shader`.  The first instance will
pass `0` as the instance ID, the second instance will pass `1` as the instance ID, etc.  You can
use an array of `mat4` variables and access the array using the supplied instance ID to specify a
list of positions to draw the instances at.
