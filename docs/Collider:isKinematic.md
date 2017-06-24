<!--
category: reference
-->

Collider:isKinematic
===

Get whether or not the collider is kinematic.

    kinematic = collider:isKinematic()

### Arguments

None

### Returns

- `boolean kinematic` Whether or not the collider is set to be kinematic.

Notes
---

Kinematic colliders behave as though they have infinite mass -- they won't react to external forces
like gravity, joints, or collisions (though non-kinematic colliders will collide with them).  They
can be useful for static objects like floors or walls.

See also
---

- `Collider:setKinematic`
- `Collider`
