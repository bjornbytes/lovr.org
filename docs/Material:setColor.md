<!--
category: reference
-->

Material:setColor
===

Set a color property for a Material.  Different types of colors are supported for different lighting
parameters.  Colors default to white and are gamma corrected as necessary.

    Material:setColor(colorType, r, g, b, a)

### Arguments

- `MaterialColor color` The type of color to set.
- `number r` The red component of the color.
- `number g` The green component of the color.
- `number b` The blue component of the color.
- `number a` The alpha component of the color.

### Returns

Nothing

---

Set the diffuse color.

    Material:setColor(r, g, b, a)

### Arguments

- `number r` The red component of the color.
- `number g` The green component of the color.
- `number b` The blue component of the color.
- `number a` The alpha component of the color.

### Returns

Nothing

See also
---

- `Material:getColor`
- `MaterialColor`
- `lovr.graphics.setColor`
