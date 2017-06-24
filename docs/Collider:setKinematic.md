<!--
category: reference
-->

Collider:setKinematic
===

Set the kinematic state on the collider.

    collider:setKinematic(kinematic)

### Arguments

- `boolean kinematic` The new kinematic state.

### Returns

Nothing

Notes
---

Kinematic colliders behave as though they have infinite mass -- they won't react to external forces
like gravity, joints, or collisions (though non-kinematic colliders will collide with them).  They
can be useful for static objects like floors or walls.

See also
---

- `Collider:isKinematic`
- `Collider`
