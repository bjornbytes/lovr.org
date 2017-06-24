<!--
category: reference
-->

World:newSphereCollider
===

Add a new `Collider` to the world with a `SphereShape` already attached.

    sphere = World:newSphereCollider(x, y, z, radius)

### Arguments

- `number x (0)` The initial x coordinate of the sphere.
- `number y (0)` The initial y coordinate of the sphere.
- `number z (0)` The initial z coordinate of the sphere.
- `number radius (1)` The radius of the sphere, in meters.

### Returns

- `Collider collider` The new Collider.

See also
---

- `SphereShape`
- `Collider`
- `World:newCollider`
- `World:newBoxCollider`
- `World:newCapsuleCollider`
- `World:newCylinderCollider`
