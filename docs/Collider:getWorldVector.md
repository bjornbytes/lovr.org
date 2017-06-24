<!--
category: reference
-->

Collider:getWorldVector
===

Convert a direction vector relative to the collider to a vector in world coordinates.

    wx, wy, wz = collider:getWorldVector(x, y, z)

### Arguments

- `number x` The x component of the vector relative to the collider.
- `number y` The y component of the vector relative to the collider.
- `number z` The z component of the vector relative to the collider.

### Returns

- `number wx` The x component of the world vector.
- `number wy` The y component of the world vector.
- `number wz` The z component of the world vector.

See also
---

- `Collider:getLocalVector`
- `Collider:getLocalPoint`
- `Collider:getWorldPoint`
