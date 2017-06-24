<!--
category: reference
-->

World:collide
===

Attempt to collide two shapes.  Internally this uses joints and forces to ensure the colliders
attached to the shapes do not pass through each other.  Collisions can be customized using friction
and restitution (bounciness) parameters, and default to using a mix of the colliders' friction and
restitution parameters.  Usually this is called automatically by `World:update`.

    didCollide = world:collide(shapeA, shapeB, friction, restitution)

### Arguments

- `Shape shapeA` The first shape.
- `Shape shapeB` The second shape.
- `number friction (nil)` The friction parameter for the collision.  Numbers in the range of 0-1 are
  common, but larger numbers can also be used.
- `number restitution (nil)` The restitution (bounce) parameter for the collision.  Numbers in the
  range 0-1 should be used.

### Returns

- `boolean didCollide` Whether the shapes successfully collided.  If this is false, then the shapes
  weren't touching.

Notes
---

This function respects collision tags, so using `World:disableCollisionBetween` and
`World:enableCollisionBetween` will change the behavior of this function.

See also
---

- `World:computeOverlaps`
- `World:overlaps`
- `World:disableCollisionBetween`
- `World:enableCollisionBetween`
- `World:isCollisionEnabledBetween`
- `World`
