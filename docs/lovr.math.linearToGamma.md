<!--
category: reference
-->

lovr.math.linearToGamma
===

Convert a color from linear space to gamma space.

    r, g, b = lovr.math.linearToGamma(r, g, b)

### Arguments

- `number r` The red component of the linear-space color.
- `number g` The green component of the linear-space color.
- `number b` The blue component of the linear-space color.

### Returns

- `number r` The red component of the resulting gamma-space color.
- `number g` The green component of the resulting gamma-space color.
- `number b` The blue component of the resulting gamma-space color.

---

A table can also be used:

    r, g, b = lovr.math.linearToGamma(color)

### Arguments

- `table color` A table containing the three color components, as above.

### Returns

- `number r` The red component of the resulting gamma-space color.
- `number g` The green component of the resulting gamma-space color.
- `number b` The blue component of the resulting gamma-space color.

---

Convert a single color channel from linear space to gamma space:

    y = lovr.math.linearToGamma(x)

### Arguments

- `number x` The color channel to convert.

### Returns

- `number y` The converted gamma-space color value.

See also
---

- `lovr.math.gammaToLinear`
- `lovr.graphics.isGammaCorrect`
