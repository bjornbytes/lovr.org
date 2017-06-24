<!--
category: reference
-->

World:update
===

Update the world, advancing the physics simulation forward in time and resolving collisions between
colliders in the world.

    world:update(dt, resolver)

### Arguments

- `number dt` The amount of time to advance the simultion forward.
- `function resolver (nil)` The collision resolver function to use.  This will be called before
  updating to allow for custom collision processing.  If absent, a default will be used.

### Returns

Nothing

Notes
---

It is common to pass the `dt` variable from `lovr.update` into this function.

The default collision resolver function is:

```
function defaultResolver(world)
  world:computeOverlaps()
  for shapeA, shapeB in world:overlaps() do
    world:collide(shapeA, shapeB)
  end
end
```

Additional logic could be introduced to the collision resolver function to add application-specific
code to collision handling or changing the collision parameters (like friction and restitution) on a
per-collision basis.

> If possible, use a fixed timestep value for updating the World.  It will greatly improve the
> accuracy of the simulation and reduce bugs.  For more information on implementing a fixed timestep
> loop, see [this article](http://gafferongames.com/game-physics/fix-your-timestep/).

See also
---

- `World:computeOverlaps`
- `World:overlaps`
- `World:collide`
- `World`
