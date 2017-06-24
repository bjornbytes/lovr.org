<!--
category: reference
-->

World:getLinearDamping
===

Get the world's linear damping parameter.  Linear damping is similar to drag or air resistance --
it makes colliders slow down automatically over time.

    damping = world:getLinearDamping()

### Arguments

None

### Returns

- `number damping` The linear damping.

Notes
---

A linear damping of 0 means colliders won't slow down over time.

Linear damping can also be set on individual colliders.

See also
---

- `World:setLinearDamping`
- `Collider:getLinearDamping`
- `Collider:setLinearDamping`
