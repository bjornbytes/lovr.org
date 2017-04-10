<!--
category: reference
-->

Font:getPixelDensity
===

Get the current pixel density of the Font.  When drawing normally or rendering to a 3D texture, the
units of this value is in pixels per meter.  When rendering to a 2D texture, the units are simply
pixels.

    pixelDensity = font:getPixelDensity()

### Arguments

None

### Returns

- `number pixelDensity` The current pixel density.

See also
---

- `Font:setPixelDensity`
