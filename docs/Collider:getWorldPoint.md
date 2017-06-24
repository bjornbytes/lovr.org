<!--
category: reference
-->

Collider:getWorldPoint
===

Convert a point relative to the collider to a point in world coordinates.

    wx, wy, wz = collider:getWorldPoint(x, y, z)

### Arguments

- `number x` The x coordinate of the point relative to the collider.
- `number y` The y coordinate of the point relative to the collider.
- `number z` The z coordinate of the point relative to the collider.

### Returns

- `number wx` The x position of the world point.
- `number wy` The y position of the world point.
- `number wz` The z position of the world point.

See also
---

- `Collider:getLocalPoint`
- `Collider:getLocalVector`
- `Collider:getWorldVector`
- `Collider:getLocalCenter`
