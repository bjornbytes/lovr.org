<!--
category: reference
-->

Collider:getOrientation
===

Get the orientation of the collider in angle-axis representation.

    angle, ax, ay, az = collider:getOrientation()

### Arguments

None

### Returns

- `number angle` The angle the collider is rotated around its axis of rotation, in radians.
- `number ax` The x component of the collider's axis of rotation.
- `number ay` The y component of the collider's axis of rotation.
- `number az` The z component of the collider's axis of rotation.

See also
---

- `Collider:setOrientation`
- `Collider:applyTorque`
- `Collider:getAngularVelocity`
- `Collider:setAngularVelocity`
- `Collider:getPosition`
- `Collider:setPosition`
