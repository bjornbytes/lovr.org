<!--
category: reference
-->

lovr.graphics.rotate
===

Rotates the coordinate system around an axis.

The rotation will last until `lovr.draw` exits or the transformation is popped off the
transformation stack.

Note that order matters when scaling, translating, and rotating the coordinate system.

    lovr.graphics.rotate(angle, ax, ay, az)

### Arguments

- `number angle (0)` The amount to rotate the coordinate system by, in radians.
- `number ax (0)` The x component of the axis of rotation.
- `number ay (1)` The y component of the axis of rotation.
- `number az (0)` The z component of the axis of rotation.

### Returns

Nothing

Example
---

Draw a spinning cube manually using `lovr.graphics.rotate`:

```
lovr.graphics.translate(0, 0, -1)
lovr.graphics.rotate(lovr.timer.getTime())
lovr.graphics.translate(0, 0, 1)

lovr.graphics.cube('line', 0, 0, -1, .5)
```
