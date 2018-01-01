<!--
category: reference
-->

lovr.headset.getPosition
===

Returns the current position of the headset in 3d space.

    x, y, z = lovr.headset.getPosition()

### Arguments

None

### Returns

- `number x` The x position of the headset.
- `number y` The y position of the headset.
- `number z` The y position of the headset.

---

Returns the current position of one of the eyes in 3d space.

    x, y, z = lovr.headset.getPosition(eye)

### Arguments

- `HeadsetEye eye` The eye to get the position of.

### Returns

- `number x` The x position of the eye.
- `number y` The y position of the eye.
- `number z` The y position of the eye.
