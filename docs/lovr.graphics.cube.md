<!--
category: reference
-->

lovr.graphics.cube
===

Draws a cube with a given position, size, and orientation.

    lovr.graphics.cube(mode, x, y, z, size, angle, ax, ay, az)

### Arguments

- `DrawMode mode` How to draw the cube.
- `number x (0)` The x coordinate of the center of the cube.
- `number y (0)` The y coordinate of the center of the cube.
- `number z (0)` The z coordinate of the center of the cube.
- `number size (1.0)` The z coordinate of the center of the cube.
- `number angle (0)` The rotation of the cube around its rotation axis, in radians.
- `number ax (0)` The x coordinate of the cube's axis of rotation.
- `number ay (1)` The y coordinate of the cube's axis of rotation.
- `number az (0)` The z coordinate of the cube's axis of rotation.

### Returns

Nothing

---

Draw a textured cube

    lovr.graphics.cube(texture, x, y, z, size, angle, ax, ay, az)

### Arguments

- `Texture texture` The Texture to apply to the cube.
- `number x (0)` The x coordinate of the center of the cube.
- `number y (0)` The y coordinate of the center of the cube.
- `number z (0)` The z coordinate of the center of the cube.
- `number size (1.0)` The z coordinate of the center of the cube.
- `number angle (0)` The rotation of the cube around its rotation axis, in radians.
- `number ax (0)` The x coordinate of the cube's axis of rotation.
- `number ay (1)` The y coordinate of the cube's axis of rotation.
- `number az (0)` The z coordinate of the cube's axis of rotation.

### Returns

Nothing
