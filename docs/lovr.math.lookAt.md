<!--
category: reference
-->

lovr.math.lookAt
===

Returns the angle/axis orientation to use to get an object to look at a point.

    angle, ax, ay, az = lovr.math.lookAt(x, y, z, tx, ty, tz, ux, uy, uz)

### Arguments

- `number x` The x position of the object.
- `number y` The y position of the object.
- `number z` The z position of the object.
- `number tx` The x position of the target to look at.
- `number ty` The y position of the target to look at.
- `number tz` The z position of the target to look at.
- `number ux (0)` The x position of the global up vector.
- `number uy (1)` The y position of the global up vector.
- `number uz (0)` The z position of the global up vector.

### Returns

- `number angle` The number of radians to rotate around the axis of rotation.
- `number ax` The x component of the axis of rotation.
- `number ay` The y component of the axis of rotation.
- `number az` The z component of the axis of rotation.

Notes
---

With the default up vector, strange things will happen when trying to look in directions that line
up with the up vector, similar to how the cameras in a first person shooter work.  Sometimes this
is alright, but other times you may want to keep track of the up vector of the camera as it rotates
and pass that in as the up vector to avoid issues.
