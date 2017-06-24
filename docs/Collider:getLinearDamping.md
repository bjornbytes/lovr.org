<!--
category: reference
-->

Collider:getLinearDamping
===

Get the collider's linear damping parameter.  Linear damping is similar to drag or air resistance --
it makes things slow down automatically over time.

    damping = collider:getLinearDamping()

### Arguments

None

### Returns

- `number damping` The linear damping.

Notes
---

A linear damping of 0 means colliders won't slow down over time.

The default linear damping parameter for new colliders can be set using `World:setLinearDamping`.

See also
---

- `World:getLinearDamping`
- `World:setLinearDamping`
- `Collider:setLinearDamping`
