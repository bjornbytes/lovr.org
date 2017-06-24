<!--
category: reference
-->

World:computeOverlaps
===

Detects which pairs of shapes in the world are near each other and could be colliding.  After
calling this function, the `World:overlaps` iterator can be used to iterate over the overlaps, and
`World:collide` can be used to resolve a collision for the shapes (if any).  Usually this is called
automatically by `World:update`.

    world:computeOverlaps()

### Arguments

None

### Returns

Nothing

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

- `World:overlaps`
- `World:collide`
- `World:update`
- `World`
