<!--
category: reference
-->

lovr.graphics.getSystemLimits
===

Returns information about the capabilities of the graphics card.

    limits = lovr.graphics.getSystemLimits()

### Arguments

None

### Returns

- `table limits` A table with string keys for graphics features and numeric values representing the
  limit of the feature.  There are currently 3 reported limits: `pointsize`, `texturesize` (maximum
  width or height of a texture), `texturemsaa` (maximum MSAA value used supported by
  `lovr.graphics.newTexture`).
