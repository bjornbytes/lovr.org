<!--
category: reference
-->

Collider:getLinearVelocity
===

Get the linear velocity of the collider.  This is how fast the collider is moving.  It's called
"linear velocity" so it doesn't get confused with "angular velocity".

    vx, vy, vz = collider:getLinearVelocity()

### Arguments

None

### Returns

- `number vx` The x velocity of the collider, in meters per second.
- `number vy` The y velocity of the collider, in meters per second.
- `number vz` The z velocity of the collider, in meters per second.

See also
---

- `Collider:getLinearVelocityFromLocalPoint`
- `Collider:getLinearVelocityFromWorldPoint`
- `Collider:setLinearVelocity`
- `Collider:applyForce`
- `Collider:getAngularVelocity`
- `Collider:setAngularVelocity`
- `Collider:getPosition`
- `Collider:setPosition`
