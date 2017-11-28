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

Notes
---

A `Material` can be passed instead of a `DrawMode` for more control over appearance.

A `Transform` can be used instead of specifying position, size, and orientation separately.

See also
---

- `lovr.graphics.cube`
