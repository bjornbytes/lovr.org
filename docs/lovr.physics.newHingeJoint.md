<!--
category: reference
-->

lovr.physics.newHingeJoint
===

Create a new `HingeJoint`.

    joint = lovr.physics.newHingeJoint(colliderA, colliderB, x, y, z, ax, ay, az)

### Arguments

- `Collider colliderA` The first collider to attach the joint to.
- `Collider colliderB` The second collider to attach the joint to.
- `number x` The x position of the anchor.
- `number y` The y position of the anchor.
- `number z` The z position of the anchor.
- `number ax` The x component of the hinge's axis.
- `number ay` The y component of the hinge's axis.
- `number az` The z component of the hinge's axis.

### Returns

- `HingeJoint joint` The new hinge joint.

Notes
---

A hinge joint constrains two colliders to allow rotation only around the hinge's axis.

See also
---

- `HingeJoint`
- `lovr.physics.newBallJoint`
- `lovr.physics.newDistanceJoint`
- `lovr.physics.newSliderJoint`
