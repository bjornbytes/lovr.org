<!--
category: reference
-->

Collider:getLocalVector
===

Convert a direction vector in world coordinates to a vector relative to the collider.

    x, y, z = collider:getLocalVector(wx, wy, wz)

### Arguments

- `number wx` The x component of the world vector.
- `number wy` The y component of the world vector.
- `number wz` The z component of the world vector.

### Returns

- `number x` The x component of the vector relative to the collider.
- `number y` The y component of the vector relative to the collider.
- `number z` The z component of the vector relative to the collider.

See also
---

- `Collider:getWorldVector`
- `Collider:getLocalPoint`
- `Collider:getWorldPoint`
