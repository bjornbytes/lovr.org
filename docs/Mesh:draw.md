<!--
category: reference
-->

Mesh:draw
===

Draws the contents of the Mesh.

    mesh:draw(x, y, z, scale, angle, ax, ay, az)

### Arguments

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

Draws the contents of the Mesh.

    mesh:draw(transform)

### Arguments

- `Transform transform` The Transform to apply to the vertices.

### Returns

Nothing
