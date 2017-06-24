<!--
category: reference
-->

World:newCapsuleCollider
===

Add a new `Collider` to the world with a `CapsuleShape` already attached.

    capsule = World:newCapsuleCollider(x, y, z, radius, length)

### Arguments

- `number x (0)` The initial x coordinate of the capsule.
- `number y (0)` The initial y coordinate of the capsule.
- `number z (0)` The initial z coordinate of the capsule.
- `number radius (1)` The radius of the capsule, in meters.
- `number length (1)` The length of the capsule (not including the caps), in meters.

### Returns

- `Collider collider` The new Collider.

See also
---

- `CapsuleShape`
- `Collider`
- `World:newCollider`
- `World:newBoxCollider`
- `World:newCylinderCollider`
- `World:newSphereCollider`
