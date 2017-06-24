<!--
category: reference
-->

Collider:setLinearVelocity
===

Set the linear velocity of the collider directly.  Usually it's preferred to use
`Collider:applyForce` to change velocity since instantaneous velocity changes can lead to weird
glitches.

    collider:setLinearVelocity(vx, vy, vz)

### Arguments

- `number vx` The x velocity of the collider, in meters per second.
- `number vy` The y velocity of the collider, in meters per second.
- `number vz` The z velocity of the collider, in meters per second.

### Returns

Nothing

See also
---

- `Collider:getLinearVelocity`
- `Collider:applyForce`
- `Collider:getLinearVelocityFromLocalPoint`
- `Collider:getLinearVelocityFromWorldPoint`
- `Collider:getAngularVelocity`
- `Collider:setAngularVelocity`
- `Collider:getPosition`
- `Collider:setPosition`
