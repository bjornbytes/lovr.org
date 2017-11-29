<!--
category: reference
-->

lovr.graphics.isGammaCorrect
===

Get whether or not gamma correct rendering is supported and enabled.  When enabled, lovr will
automatically perform gamma correction on colors set via `lovr.graphics.setColor`,
`lovr.graphics.setBackgroundColor`, `Material:setColor`, and textures created without the `linear`
flag set.  Gamma correction will subtly improve lighting quality, especially in darker regions.

    isGammaCorrect = lovr.graphics.isGammaCorrect()

### Arguments

None

### Returns

- `boolean isGammaCorrect` Whether or not gamma correction is applied to colors.

Notes
---

Gamma correction must be set in `lovr.conf`.

See also
---

- `lovr.conf`
- `lovr.math.gammaToLinear`
- `lovr.math.linearToGamma`
