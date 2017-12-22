<!--
category: reference
-->

lovr.graphics.print
===

Draws text in 3D space using the active font.

    lovr.graphics.print(str, x, y, z, scale, angle, ax, ay, az, wrap, halign, valign)

### Arguments

- `string str` The text to draw.
- `number x (0)` The x coordinate of the center of the text.
- `number y (0)` The y coordinate of the center of the text.
- `number z (0)` The z coordinate of the center of the text.
- `number scale (1)` The scale of the text.  This, combined with the pixel density of the Font, will
  control the size of the text.
- `number angle (0)` The rotation of the cube around its rotation axis, in radians.
- `number ax (0)` The x coordinate of the cube's axis of rotation.
- `number ay (1)` The y coordinate of the cube's axis of rotation.
- `number az (0)` The z coordinate of the cube's axis of rotation.
- `number wrap (0)` The maximum width of each line, in meters (affected by `scale`).  Set to 0 or
  `nil` for no wrapping.
- `HorizontalAlign halign` How to horizontally align each line.
- `VerticalAlign valign` How to vertically align each line.

### Returns

Nothing

Notes
---

Unicode text is supported.  Use `\n` to add a line break.

LÖVR uses a fancy technique for font rendering called multichanel signed distance fields.  This leads
to crisp text in VR, but requires a special shader to use.  LÖVR internally switches to the appropriate
shader, but only when the default shader is already set.  If you see strange font artifacts, make
sure you switch back to the default shader by using `lovr.graphics.setShader()` before you draw
text.

See also
---

- `lovr.graphics.setFont`
- `lovr.graphics.getFont`
- `lovr.graphics.newFont`
- `Font`
