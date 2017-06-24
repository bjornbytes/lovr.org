<!--
category: reference
-->

Collider:setLinearDamping
===

Set the collider's linear damping parameter.  Linear damping is similar to drag or air resistance --
it makes things slow down automatically over time.

    collider:setLinearDamping(damping)

### Arguments

- `number damping` The linear damping.

### Returns

Nothing

Notes
---

A linear damping of 0 means colliders won't slow down over time.

The default linear damping parameter for new colliders can be set using `World:setLinearDamping`.

See also
---

- `World:getLinearDamping`
- `World:setLinearDamping`
- `Collider:getLinearDamping`
