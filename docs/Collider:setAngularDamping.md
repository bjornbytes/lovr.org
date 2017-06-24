<!--
category: reference
-->

Collider:setAngularDamping
===

Set the collider's angular damping parameter.  Angular damping makes things less "spinny", making
them slow down their angular velocity over time.

    collider:setAngularDamping(damping)

### Arguments

- `number damping` The angular damping.

### Returns

Nothing

Notes
---

The default angular damping parameter for new colliders can be set using `World:setAngularDamping`.

See also
---

- `World:getAngularDamping`
- `World:setAngularDamping`
- `Collider:getAngularDamping`
