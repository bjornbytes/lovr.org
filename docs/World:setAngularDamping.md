<!--
category: reference
-->

World:setAngularDamping
===

Set the world's angular damping parameter.  Angular damping makes things less "spinny", making
them slow down their angular velocity over time.

    world:setAngularDamping(damping)

### Arguments

- `number damping` The angular damping.

### Returns

Nothing

Notes
---

Angular damping can also be set on individual colliders.

See also
---

- `World:getAngularDamping`
- `Collider:getAngularDamping`
- `Collider:setAngularDamping`
