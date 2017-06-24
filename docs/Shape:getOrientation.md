<!--
category: reference
-->

Shape:getOrientation
===

Get the orientation of the shape, relative to the collider it's attached to.

    angle, ax, ay, az = shape:getOrientation()

### Arguments

None

### Returns

- `number angle` The number of radians the shape is rotated around its axis of rotation.
- `number ax` The x component of the shape's axis of rotation.
- `number ay` The y component of the shape's axis of rotation.
- `number az` The z component of the shape's axis of rotation.

See also
---

- `Shape:getPosition`
- `Shape:setPosition`
- `Shape:setOrientation`
- `Shape`
