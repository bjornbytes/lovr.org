<!--
category: reference
-->

lovr.graphics.circle
===

Draws a circle.

    lovr.graphics.circle(mode, x, y, z, radius, angle, ax, ay, az, segments)

### Arguments

- `DrawMode mode` How to draw the circle.
- `number x (0)` The x coordinate of the center of the circle.
- `number y (0)` The y coordinate of the center of the circle.
- `number z (0)` The z coordinate of the center of the circle.
- `number radius (1)` The radius of the circle, in meters.
- `number angle (0)` The rotation of the circle around its rotation axis, in radians.
- `number ax (0)` The x coordinate of the circle's axis of rotation.
- `number ay (1)` The y coordinate of the circle's axis of rotation.
- `number az (0)` The z coordinate of the circle's axis of rotation.
- `number segments (32)` The number of segments to use for the circle.

### Returns

Nothing

Notes
---

A `Material` can be passed instead of a `DrawMode` for more control over appearance.

A `Transform` can be used instead of specifying position, size, and orientation separately.

See also
---

- `lovr.graphics.arc`
