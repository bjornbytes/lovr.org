<!--
category: reference
-->

Collider:getAngularDamping
===

Get the collider's angular damping parameter.  Angular damping makes things less "spinny", making
them slow down their angular velocity over time.

    damping = collider:getAngularDamping()

### Arguments

None

### Returns

- `number damping` The angular damping.

Notes
---

The default angular damping parameter for new colliders can be set using `World:setAngularDamping`.

See also
---

- `World:getAngularDamping`
- `World:setAngularDamping`
- `Collider:setAngularDamping`
