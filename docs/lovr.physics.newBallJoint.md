<!--
category: reference
-->

lovr.physics.newBallJoint
===

Create a new `BallJoint`.

    joint = lovr.physics.newBallJoint(colliderA, colliderB, x, y, z)

### Arguments

- `Collider colliderA` The first collider to attach the joint to.
- `Collider colliderB` The second collider to attach the joint to.
- `number x` The x position of the joint's anchor.
- `number y` The y position of the joint's anchor.
- `number z` The z position of the joint's anchor.

### Returns

- `BallJoint joint` The new ball joint.

Notes
---

A ball joint is like a ball and socket between the two colliders.  It tries to keep the distance
between the colliders and the anchor position the same, but does not constrain the angle between
them.

See also
---

- `BallJoint`
- `lovr.physics.newDistanceJoint`
- `lovr.physics.newHingeJoint`
- `lovr.physics.newSliderJoint`
