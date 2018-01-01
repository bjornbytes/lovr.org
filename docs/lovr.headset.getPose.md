<!--
category: reference
-->

lovr.headset.getPosition
===

Returns the position and orientation of the headset in 3d space.

    x, y, z, angle, ax, ay, az = lovr.headset.getPose()

### Arguments

None

### Returns

- `number x` The x position of the headset.
- `number y` The y position of the headset.
- `number z` The y position of the headset.
- `number angle` The number of radians the headset is rotated around its axis of rotation.
- `number ax` The x component of the axis of rotation.
- `number ay` The y component of the axis of rotation.
- `number az` The z component of the axis of rotation.

---

Returns the position and orientation of one of the eyes in 3d space.

    x, y, z = lovr.headset.getPose(eye)

### Arguments

- `HeadsetEye eye` The eye to get the pose of.

### Returns

- `number x` The x position of the eye.
- `number y` The y position of the eye.
- `number z` The y position of the eye.
- `number angle` The number of radians the eye is rotated around its axis of rotation.
- `number ax` The x component of the axis of rotation.
- `number ay` The y component of the axis of rotation.
- `number az` The z component of the axis of rotation.

See also
---

- `lovr.headset.getPosition`
- `lovr.headset.getOrientation`
