<!--
category: reference
-->

lovr.audio.getOrientation
===

Returns the current orientation of the listener in angle-axis representation.

    angle, ax, ay, az = lovr.audio.getOrientation()

### Arguments

None

### Returns

- `number angle` The number of radians the listener is rotated around its axis of rotation.
- `number ax` The x component of the axis of rotation.
- `number ay` The y component of the axis of rotation.
- `number az` The z component of the axis of rotation.

See also
---

- `lovr.audio.setOrientation`
