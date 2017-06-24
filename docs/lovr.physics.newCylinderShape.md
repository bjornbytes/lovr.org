<!--
category: reference
-->

lovr.physics.newCylinderShape
===

Create a new `CylinderShape`.

    cylinder = lovr.physics.newCylinderShape(radius, length)

### Arguments

- `number radius` The radius of the cylinder.
- `number length` The length of the cylinder.

### Returns

- `CylinderShape cylinder` The new cylinder shape.  It can be attached to a collider using
  `Collider:addShape`.

See also
---

- `CylinderShape`
- `lovr.physics.newBoxShape`
- `lovr.physics.newCapsuleShape`
- `lovr.physics.newSphereShape`
