<!--
category: reference
-->

Material:getColor
===

Get a color property for a Material.  Different types of colors are supported for different lighting
parameters.  Colors default to white and are gamma corrected as necessary.

    r, g, b, a = Material:getColor(colorType)

### Arguments

- `MaterialColor color (diffuse)` The type of color to get.

### Returns

- `number r` The red component of the color.
- `number g` The green component of the color.
- `number b` The blue component of the color.
- `number a` The alpha component of the color.

See also
---

- `Material:setColor`
- `MaterialColor`
- `lovr.graphics.setColor`
