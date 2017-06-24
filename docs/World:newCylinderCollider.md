<!--
category: reference
-->

World:newCylinderCollider
===

Add a new `Collider` to the world with a `CylinderShape` already attached.

    cylinder = World:newCylinderCollider(x, y, z, radius, length)

### Arguments

- `number x (0)` The initial x coordinate of the cylinder.
- `number y (0)` The initial y coordinate of the cylinder.
- `number z (0)` The initial z coordinate of the cylinder.
- `number radius (1)` The radius of the cylinder, in meters.
- `number length (1)` The length of the cylinder, in meters.

### Returns

- `Collider collider` The new Collider.

See also
---

- `CylinderShape`
- `Collider`
- `World:newCollider`
- `World:newBoxCollider`
- `World:newCapsuleCollider`
- `World:newSphereCollider`
