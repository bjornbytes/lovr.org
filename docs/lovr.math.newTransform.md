<!--
category: reference
-->

lovr.math.newTransform
===

Creates a new `Transform`.

    transform = lovr.math.newTransform(x, y, z, sx, sy, sz, angle, ax, ay, az)

### Arguments

- `number x (0)` The x position of the Transform.
- `number y (0)` The y position of the Transform.
- `number z (0)` The z position of the Transform.
- `number sx (1)` The x scale of the Transform.
- `number sy (1)` The y scale of the Transform.
- `number sz (1)` The z scale of the Transform.
- `number angle (0)` The number of radians the Transform is rotated around its axis of rotation.
- `number ax (0)` The x component of the axis of rotation.
- `number ay (1)` The y component of the axis of rotation.
- `number az (0)` The z component of the axis of rotation.

### Returns

- `Transform transform` The new Transform.

See also
---

- `lovr.math`
