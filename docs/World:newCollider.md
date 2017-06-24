<!--
category: reference
-->

World:newCollider
===

Add a new `Collider` to the world.

    collider = World:newCollider(x, y, z)

### Arguments

- `number x (0)` The initial x coordinate of the collider.
- `number y (0)` The initial y coordinate of the collider.
- `number z (0)` The initial z coordinate of the collider.

### Returns

- `Collider collider` The new Collider.

Notes
---

This function creates a collider without any shapes attached to it, which means it won't collide
with anything.  To add a shape to the collider, use `Collider:addShape`, or use one of the following
functions to create the collider:

- `World:newBoxCollider`
- `World:newCapsuleCollider`
- `World:newCylinderCollider`
- `World:newSphereCollider`

Example
---

Create a new world, add a collider to it, and update it, printing out the collider's position as it
falls.

```
function lovr.load()
  world = lovr.physics.newWorld()
  box = world:newBoxCollider()
end

function lovr.update(dt)
  world:update(dt)
  print(box:getPosition())
end
```

See also
---

- `World:newBoxCollider`
- `World:newCapsuleCollider`
- `World:newCylinderCollider`
- `World:newSphereCollider`
- `Collider`
- `Shape`
