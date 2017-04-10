<!--
category: reference
-->

Font:getWidth
===

Returns the width of a string when rendered using the font, with an optional wrap.  To get the
correct units returned, make sure the pixel density is set with `Font:setPixelDensity`.

    width = font:getWidth(text, wrap)

### Arguments

- `string text` The text to get the width of.
- `number wrap (0)` The width at which to wrap lines.

### Returns

- `number width` The maximum width of any line in the text.
