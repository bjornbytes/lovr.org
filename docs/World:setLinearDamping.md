<!--
category: reference
-->

World:setLinearDamping
===

Set the world's linear damping parameter.  Linear damping is similar to drag or air resistance --
it makes colliders slow down automatically over time.

    world:setLinearDamping(damping)

### Arguments

- `number damping` The new linear damping.

### Returns

Nothing

Notes
---

Linear damping can also be set on individual colliders.

See also
---

- `World:getLinearDamping`
- `Collider:getLinearDamping`
- `Collider:setLinearDamping`
