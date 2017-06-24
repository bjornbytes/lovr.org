<!--
category: reference
-->

lovr.physics.newBoxShape
===

Create a new `BoxShape`.

    box = lovr.physics.newBoxShape(x, y, z)

### Arguments

- `number x` The width of the box, in meters.
- `number y` The height of the box, in meters.
- `number z` The depth of the box, in meters.

### Returns

- `BoxShape box` The new box shape.  It can be attached to a collider using `Collider:addShape`.

See also
---

- `BoxShape`
- `lovr.physics.newCapsuleShape`
- `lovr.physics.newCylinderShape`
- `lovr.physics.newSphereShape`
