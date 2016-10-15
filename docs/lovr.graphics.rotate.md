lovr.graphics.rotate
---

Rotates the coordinate system around an axis.

The rotation will last until `lovr.draw` exits or the transformation is popped off the
transformation stack.

Note that order matters when scaling, translating, and rotating the coordinate system.

    lovr.graphics.rotate(angle, ax, ay, az)

#### Arguments

- `number angle` The amount to rotate the coordinate system by, in radians.
- `number ax` The x component of the axis of rotation.
- `number ay` The y component of the axis of rotation.
- `number az` The z component of the axis of rotation.

#### Returns

- Nothing
