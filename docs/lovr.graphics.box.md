<!--
category: reference
-->

lovr.graphics.box
===

Draws a box with a given position, size, and orientation.

    lovr.graphics.box(mode, x, y, z, sx, sy, sz, angle, ax, ay, az)

### Arguments

- `DrawMode mode` How to draw the box.
- `number x (0)` The x coordinate of the center of the box.
- `number y (0)` The y coordinate of the center of the box.
- `number z (0)` The z coordinate of the center of the box.
- `number sx (1)` The width of the box, in meters.
- `number sy (1)` The height of the box, in meters.
- `number sz (1)` The depth of the box, in meters.
- `number angle (0)` The rotation of the box around its rotation axis, in radians.
- `number ax (0)` The x coordinate of the box's axis of rotation.
- `number ay (1)` The y coordinate of the box's axis of rotation.
- `number az (0)` The z coordinate of the box's axis of rotation.

### Returns

Nothing

---

Draw a textured box

    lovr.graphics.box(texture, x, y, z, sx, sy, sz, angle, ax, ay, az)

### Arguments

- `Texture texture` The Texture to apply to the box.
- `number x (0)` The x coordinate of the center of the box.
- `number y (0)` The y coordinate of the center of the box.
- `number z (0)` The z coordinate of the center of the box.
- `number sx (1)` The width of the box, in meters.
- `number sy (1)` The height of the box, in meters.
- `number sz (1)` The depth of the box, in meters.
- `number angle (0)` The rotation of the box around its rotation axis, in radians.
- `number ax (0)` The x coordinate of the box's axis of rotation.
- `number ay (1)` The y coordinate of the box's axis of rotation.
- `number az (0)` The z coordinate of the box's axis of rotation.

### Returns

Nothing

---

Draw a box using a `Transform`.

    lovr.graphics.box(mode, transform)

- `DrawMode mode` How to draw the box.
- `Transform transform` The Transform to apply to the box.

---

Draw a textured box using a `Transform`.

    lovr.graphics.box(texture, transform)

- `Texture texture` The Texture to apply to the box.
- `Transform transform` The Transform to apply to the box.

See also
---

- `lovr.graphics.cube`
