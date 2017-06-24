<!--
category: reference
-->

World:raycast
===

Cast a ray against the world, calling a function every time the ray intersects with a shape.

    world:raycast(x1, y1, z1, x2, y2, z2, callback)

### Arguments

- `number x1` The x coordinate of the ray's starting position.
- `number y1` The y coordinate of the ray's starting position.
- `number z1` The z coordinate of the ray's starting position.
- `number x2` The x coordinate of the ray's ending position.
- `number y2` The y coordinate of the ray's ending position.
- `number z2` The z coordinate of the ray's ending position.
- `function callback` The function to call when an intersection is detected.  The callback is passed
  the shape that was hit, the hit position, and the normal vector of the hit.

### Returns

Nothing

Example
---

```
function lovr.load()
  world = lovr.physics.newWorld()
  world:newSphereCollider(0, 0, 0, 2)

  -- Cast a ray through the sphere
  local x1, y1, z1 = .5, 3, 0
  local x2, y2, z2 = -.5, -2, 0
  world:raycast(x1, y1, z1, x2, y2, z2, function(shape, x, y, z, nx, ny, nz)
    print('Collision detected!', shape, x, y, z, nx, ny, nz)
  end)
end
```

See also
---

- `World`
