<!--
category: reference
-->

lovr.graphics.translate
---

Translates the coordinate system in three dimensions.  All graphics operations that use coordinates
will behave as if they are offset by the translation value.

The translation will last until `lovr.draw` exits or the transformation is popped off the
transformation stack.

Note that order matters when scaling, translating, and rotating the coordinate system.

    lovr.graphics.translate(x, y, z)

#### Arguments

- `number x` The amount to translate on the x axis.
- `number y` The amount to translate on the y axis.
- `number z` The amount to translate on the z axis.

#### Returns

- Nothing
