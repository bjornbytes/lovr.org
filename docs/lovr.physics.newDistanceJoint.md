<!--
category: reference
-->

lovr.physics.newDistanceJoint
===

Create a new `DistanceJoint`.

    joint = lovr.physics.newDistanceJoint(colliderA, colliderB, x1, y1, z1, x2, y2, z2)

### Arguments

- `Collider colliderA` The first collider to attach the joint to.
- `Collider colliderB` The second collider to attach the joint to.
- `number x1` The x position to anchor the first collider to, in world coordinates.
- `number y1` The y position to anchor the first collider to, in world coordinates.
- `number z1` The z position to anchor the first collider to, in world coordinates.
- `number x2` The x position to anchor the second collider to, in world coordinates.
- `number y2` The y position to anchor the second collider to, in world coordinates.
- `number z2` The z position to anchor the second collider to, in world coordinates.

### Returns

- `DistanceJoint joint` The new distance joint.

Notes
---

A distance joint tries to keep the two colliders a fixed distance apart.

See also
---

- `DistanceJoint`
- `lovr.physics.newBallJoint`
- `lovr.physics.newHingeJoint`
- `lovr.physics.newSliderJoint`
