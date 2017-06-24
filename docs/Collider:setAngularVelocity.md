<!--
category: reference
-->

Collider:setAngularVelocity
===

Set the angular velocity of the collider directly.  It's usually preferred to use
`Collider:applyTorque` for this.

    collider:setAngularVelocity(vx, vy, vz)

### Arguments

- `number vx` The x component of the collider's new angular velocity.
- `number vy` The y component of the collider's new angular velocity.
- `number vz` The z component of the collider's new angular velocity.

### Returns

Nothing

See also
---

- `Collider:getAngularVelocity`
- `Collider:applyTorque`
- `Collider:getOrientation`
- `Collider:setOrientation`
