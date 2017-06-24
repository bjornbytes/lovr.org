<!--
category: reference
-->

lovr.graphics.transform
===

---

Transform the coordinate system using a `Transform` object.  Transforms provide a convenient way
to represent translations, rotations, and scales in a single object.  All coordinates used in
drawing operations will be transformed by the specified Transform until the coordinate system is
popped off the stack.

Note that order matters when transforming the coordinate system.

    lovr.graphics.transform(transform)

### Arguments

- `Transform transform` The Transform to apply to the coordinate system.

### Returns

Nothing

---

Transforms the coordinate system's position, scale, and rotation using a single function.

    lovr.graphics.transform(x, y, z, sx, sy, sz, angle, ax, ay, az)

### Arguments

- `number x (0)` The x component of the translation.
- `number y (0)` The y component of the translation.
- `number z (0)` The z component of the translation.
- `number sx (1)` The x component of the scale.
- `number sy (1)` The y component of the scale.
- `number sz (1)` The z component of the scale.
- `number angle (0)` The number of radians to rotate around the axis of rotation.
- `number ax (0)` The x component of the axis of rotation.
- `number ay (1)` The y component of the axis of rotation.
- `number az (0)` The z component of the axis of rotation.

### Returns

Nothing

See also
---

- `Transform`
- `lovr.graphics.translate`
- `lovr.graphics.scale`
- `lovr.graphics.rotate`
