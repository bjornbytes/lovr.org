<!--
category: reference
-->

World:overlaps
===

Returns an iterator that can be used to iterate over "overlaps", or potential collisions between
pairs of shapes in the world.  This should be called after using `World:detectOverlaps` to compute
the list of overlaps.  Usually this is called automatically by `World:update`.

    iterator = world:overlaps()

### Arguments

None

### Returns

- `function iterator` A Lua iterator, meant to be used in a for loop.

Example
---

```
world:computeOverlaps()
for shapeA, shapeB in world:overlaps() do
  print('These two shapes might be colliding with each other:', shapeA, shapeB)
end
```

See also
---

- `World:computeOverlaps`
- `World:collide`
- `World:update`
- `World`
