<!--
category: reference
-->

lovr.graphics.setColor
===

Sets the color used for drawing objects.  Color components are from 0.0 to 1.0.  The default color
is white.

    lovr.graphics.setColor(r, g, b, a)

### Arguments

- `number r` The red component of the color.
- `number g` The green component of the color.
- `number b` The blue component of the color.
- `number a (1.0)` The alpha component of the color.

### Returns

Nothing

Notes
---

There are a few different ways you can specify colors:

    lovr.graphics.setColor(r, g, b, a) -- 4 numbers between 0.0 and 1.0
    lovr.graphics.setColor(r, g, b) -- set r, g, b, alpha is set to 1.0
    lovr.graphics.setColor({ r, g, b, a }) -- using a table
