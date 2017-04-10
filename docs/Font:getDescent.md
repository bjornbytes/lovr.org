<!--
category: reference
-->

Font:getDescent
===

Returns the maximum distance that any glyph will extend below the Font's baseline.  Units are
generally in meters, see `Font:getPixelDensity` for more information.  Note that due to the
coordinate system for fonts, this is a negative value.

    descent = font:getDescent()

### Arguments

None

### Returns

- `number descent` The descent of the Font.

See also
---

- `Font:getAscent`
- `Font:getBaseline`
