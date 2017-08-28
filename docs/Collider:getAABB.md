<!--
category: reference
-->

Collider:getAABB
===

Get the bounding box of the collider.  This is computed from attached shapes.

    minx, maxx, miny, maxy, minz, maxz = collider:getAABB()

### Arguments

None

### Returns

- `number minx` The minimum x coordinate of the bounding box.
- `number maxx` The maximum x coordinate of the bounding box.
- `number miny` The minimum y coordinate of the bounding box.
- `number maxy` The maximum y coordinate of the bounding box.
- `number minz` The minimum z coordinate of the bounding box.
- `number maxz` The maximum z coordinate of the bounding box.

See also
---

- `Shape:getAABB`
- `Model:getAABB`
