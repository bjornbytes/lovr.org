<!--
category: reference
-->

lovr.graphics.arc
===

Draws an arc between two angles of a circle with the specified radius.

    lovr.graphics.arc(mode, x, y, z, radius, angle, ax, ay, az, start, end, segments)

### Arguments

- `DrawMode mode` Whether the arc is filled or stroked.
- `number x (0)` The x coordinate of the center of the circle.
- `number y (0)` The y coordinate of the center of the circle.
- `number z (0)` The z coordinate of the center of the circle.
- `number radius (1)` The radius of the circle, in meters.
- `number angle (0)` The rotation of the circle around its rotation axis, in radians.
- `number ax (0)` The x coordinate of the circle's axis of rotation.
- `number ay (1)` The y coordinate of the circle's axis of rotation.
- `number az (0)` The z coordinate of the circle's axis of rotation.
- `number start (0)` The starting angle of the arc, in radians.
- `number end (2 * math.pi)` The ending angle of the arc, in radians.
- `number segments (32)` The number of segments to use for the full circle.  A smaller number of
  segments will be used, depending on how long the arc is.

### Returns

Nothing

---

Draws an arc between two angles of a circle with the specified radius and arc mode.

    lovr.graphics.arc(mode, arcmode, x, y, z, radius, angle, ax, ay, az, start, end, segments)

### Arguments

- `DrawMode mode` Whether the arc is filled or stroked.
- `ArcMode arcmode (pie)` How to draw the arc.
- `number x (0)` The x coordinate of the center of the circle.
- `number y (0)` The y coordinate of the center of the circle.
- `number z (0)` The z coordinate of the center of the circle.
- `number radius (1)` The radius of the circle, in meters.
- `number angle (0)` The rotation of the circle around its rotation axis, in radians.
- `number ax (0)` The x coordinate of the circle's axis of rotation.
- `number ay (1)` The y coordinate of the circle's axis of rotation.
- `number az (0)` The z coordinate of the circle's axis of rotation.
- `number start (0)` The starting angle of the arc, in radians.
- `number end (2 * math.pi)` The ending angle of the arc, in radians.
- `number segments (32)` The number of segments to use for the full circle.  A smaller number of
  segments will be used, depending on how long the arc is.

### Returns

Nothing

Notes
---

A `Material` can be passed instead of a `DrawMode` for more control over appearance.

A `Transform` can be used instead of specifying position, size, and orientation separately.

See also
---

- `lovr.graphics.circle`
- `ArcMode`
