<!--
category: reference
-->

Controller:getPose
===

Returns the current position and orientation of the controller in 3d space.

    x, y, z, angle, ax, ay, az = controller:getPose()

### Arguments

None

### Returns

- `number x` The x position of the controller.
- `number y` The y position of the controller.
- `number z` The z position of the controller.
- `number angle` The number of radians the controller is rotated around its axis of rotation.
- `number ax` The x component of the axis of rotation.
- `number ay` The y component of the axis of rotation.
- `number az` The z component of the axis of rotation.

See also
---

- `Controller:getPosition`
- `Controller:getOrientation`
