<!--
category: reference
-->

World:getAngularDamping
===

Get the world's angular damping parameter.  Angular damping makes things less "spinny", making
them slow down their angular velocity over time.

    damping = world:getAngularDamping()

### Arguments

None

### Returns

- `number damping` The angular damping.

Notes
---

Angular damping can also be set on individual colliders.

See also
---

- `World:setAngularDamping`
- `Collider:getAngularDamping`
- `Collider:setAngularDamping`
