<!--
category: reference
-->

lovr.physics.newCapsuleShape
===

Create a new `CapsuleShape`.

    capsule = lovr.physics.newCapsuleShape(radius, length)

### Arguments

- `number radius` The radius of the capsule.
- `number length` The length of the capsule, not including the caps.

### Returns

- `CapsuleShape capsule` The new capsule shape.  It can be attached to a collider using
  `Collider:addShape`.

See also
---

- `CapsuleShape`
- `lovr.physics.newBoxShape`
- `lovr.physics.newCylinderShape`
- `lovr.physics.newSphereShape`
