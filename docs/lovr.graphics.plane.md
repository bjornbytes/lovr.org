<!--
category: reference
-->

lovr.graphics.plane
===

Draws a plane with a given position, size, and orientation.

    lovr.graphics.plane(mode, x, y, z, size, angle, ax, ay, az)

### Arguments

- `DrawMode mode` How to draw the plane.
- `number x (0)` The x coordinate of the center of the plane.
- `number y (0)` The y coordinate of the center of the plane.
- `number z (0)` The z coordinate of the center of the plane.
- `number size (1.0)` The size of the plane, in meters.
- `number angle (0.0)` The number of radians to rotate the plane around its axis of rotation.
- `number ax (0.0)` The x component of the axis of rotation.
- `number ay (1.0)` The y component of the axis of rotation.
- `number az (0.0)` The z component of the axis of rotation.

### Returns

Nothing

---

Draw a textured plane that takes up the whole screen.  Note that a special shader is required that
does not use `lovrProjection` or `lovrTransform` when calculating the vertex position.  To have LÖVR
automatically use this Shader, make sure the default shader is set (by calling
`lovr.graphics.setShader()`) before drawing the fullscreen quad.

    lovr.graphics.plane(texture)

### Arguments

- `Texture texture` The texture to use.

### Returns

Nothing
