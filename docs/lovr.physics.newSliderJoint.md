<!--
category: reference
-->

lovr.physics.newSliderJoint
===

Create a new `SliderJoint`.

    joint = lovr.physics.newSliderJoint(colliderA, colliderB, ax, ay, az)

### Arguments

- `Collider colliderA` The first collider to attach the joint to.
- `Collider colliderB` The second collider to attach the joint to.
- `number ax` The x component of the slider axis.
- `number ay` The y component of the slider axis.
- `number az` The z component of the slider axis.

### Returns

- `SliderJoint joint` The new slider joint.

Notes
---

A slider joint constrains two colliders to allow movement only on the slider's axis.

See also
---

- `SliderJoint`
- `lovr.physics.newBallJoint`
- `lovr.physics.newDistanceJoint`
- `lovr.physics.newHingeJoint`
