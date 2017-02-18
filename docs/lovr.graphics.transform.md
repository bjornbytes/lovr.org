<!--
category: reference
-->

lovr.graphics.transform
===

Transform the coordinate system using a `Transform` object.  Transforms provide a convenient way
to represent translations, rotations, and scales in a single object.  All coordinates used in
drawing operations will be transformed by the specified Transform until the coordinate system is
popped off the stack.

Note that order matters when transforming the coordinate system.

    lovr.graphics.transform(transform)

### Arguments

- `Transform transform` The Transform to apply to the coordinate system.

### Returns

Nothing

See also
---

- `Transform`
