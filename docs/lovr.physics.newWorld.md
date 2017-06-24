<!--
category: reference
-->

lovr.physics.newWorld
===

Creates a new physics `World`, which tracks the overall physics simulation, holds collider objects,
and resolves collisions between them.

    world = lovr.physics.newWorld(xg, yg, zg, allowSleep, tags)

### Arguments

- `number xg (0)` The x component of the gravity force.
- `number yg (-9.81)` The y component of the gravity force.
- `number zg (0)` The z component of the gravity force.
- `boolean allowSleep (true)` Whether or not colliders will automatically be put to sleep.
- `table tags ({})` A list of collision tags colliders can be assigned to.

### Returns

- `World world` A whole new world.

Notes
---

A world must be updated with `World:update` in `lovr.update` for the physics simulation to advance.

Example
---

Create a new world, add a collider to it, and update it, printing out its position as it falls.

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

- `World`
- `lovr.physics`
