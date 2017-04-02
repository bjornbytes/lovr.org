<!--
category: reference
-->

lovr.graphics.scale
===

Scales the coordinate system in 3 dimensions.  This will cause objects to appear bigger or smaller.

The scaling will last until `lovr.draw` exits or the transformation is popped off the transformation
stack.

Note that order matters when scaling, translating, and rotating the coordinate system.

    lovr.graphics.scale(x, y, z)

### Arguments

- `number x (1)` The amount to scale on the x axis.
- `number y (x)` The amount to scale on the y axis.
- `number z (x)` The amount to scale on the z axis.

### Returns

Nothing
