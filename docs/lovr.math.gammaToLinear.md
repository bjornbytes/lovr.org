<!--
category: reference
-->

lovr.math.gammaToLinear
===

Convert a color from gamma space to linear space.

    r, g, b = lovr.math.gammaToLinear(r, g, b)

### Arguments

- `number r` The red component of the gamma-space color.
- `number g` The green component of the gamma-space color.
- `number b` The blue component of the gamma-space color.

### Returns

- `number r` The red component of the resulting linear-space color.
- `number g` The green component of the resulting linear-space color.
- `number b` The blue component of the resulting linear-space color.

---

A table can also be used:

    r, g, b = lovr.math.gammaToLinear(color)

### Arguments

- `table color` A table containing the three color components, as above.

### Returns

- `number r` The red component of the resulting linear-space color.
- `number g` The green component of the resulting linear-space color.
- `number b` The blue component of the resulting linear-space color.

---

Convert a single color channel from gamma space to linear space:

    y = lovr.math.gammaToLinear(x)

### Arguments

- `number x` The color channel to convert.

### Returns

- `number y` The converted linear-space color value.

See also
---

- `lovr.math.linearToGamma`
- `lovr.graphics.isGammaCorrect`
