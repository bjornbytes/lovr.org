<!--
category: reference
-->

BallJoint:getAnchors
===

Returns the joint anchor points.

    x1, y1, z1, x2, y2, z2 = ball:getAnchors()

### Arguments

None

### Returns

- `number x1` The x position of the anchor on the first Collider, in world coordinates.
- `number y1` The y position of the anchor on the first Collider, in world coordinates.
- `number z1` The z position of the anchor on the first Collider, in world coordinates.
- `number x2` The x position of the anchor on the second Collider, in world coordinates.
- `number y2` The y position of the anchor on the second Collider, in world coordinates.
- `number z2` The z position of the anchor on the second Collider, in world coordinates.

Notes
---

If the joint is in a good state, the two sets of points will be identical.

See also
---

- `BallJoint`
- `BallJoint:setAnchor`
