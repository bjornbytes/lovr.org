<!--
category: reference
-->

World:newBoxCollider
===

Add a new `Collider` to the world with a `BoxShape` already attached.

    box = World:newBoxCollider(x, y, z, width, height, depth)

### Arguments

- `number x (0)` The initial x coordinate of the box.
- `number y (0)` The initial y coordinate of the box.
- `number z (0)` The initial z coordinate of the box.
- `number width (1)` The width of the box, in meters.
- `number height (width)` The height of the box, in meters.
- `number depth (width)` The depth of the box, in meters.

### Returns

- `Collider collider` The new Collider.

See also
---

- `BoxShape`
- `Collider`
- `World:newCollider`
- `World:newCapsuleCollider`
- `World:newCylinderCollider`
- `World:newSphereCollider`
