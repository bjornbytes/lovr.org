<!--
category: reference
-->

Collider:getLinearVelocityFromWorldPoint
===

Get the linear velocity of a point on the collider specified in world space.

    vx, vy, vz = collider:getLinearVelocityFromWorldPoint(x, y, z)

### Arguments

- `number x` The x coordinate in world coordinates.
- `number y` The y coordinate in world coordinates.
- `number z` The z coordinate in world coordinates.

### Returns

- `number vx` The x component of the velocity of the point.
- `number vy` The y component of the velocity of the point.
- `number vz` The z component of the velocity of the point.

See also
---

- `Collider:getLinearVelocity`
- `Collider:getLinearVelocityFromLocalPoint`
