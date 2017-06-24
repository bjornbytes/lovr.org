<!--
category: reference
-->

Collider:getLocalPoint
===

Convert a point in world coordinates to a point relative to the collider.

    x, y, z = collider:getLocalPoint(wx, wy, wz)

### Arguments

- `number wx` The x coordinate of the world point.
- `number wy` The y coordinate of the world point.
- `number wz` The z coordinate of the world point.

### Returns

- `number x` The x position of the point relative to the collider.
- `number y` The y position of the point relative to the collider.
- `number z` The z position of the point relative to the collider.

See also
---

- `Collider:getLocalCenter`
- `Collider:getWorldPoint`
- `Collider:getLocalVector`
- `Collider:getWorldVector`
