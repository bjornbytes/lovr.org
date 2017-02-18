<!--
category: reference
-->

lovr.graphics.print
===

Draws text in 3D space using the active font.

    lovr.graphics.print(str, x, y, z, w, h, angle, ax, ay, az)

### Arguments

- `string str` The text to draw.
- `number x (0)` The x coordinate of the center of the text.
- `number y (0)` The y coordinate of the center of the text.
- `number z (0)` The z coordinate of the center of the text.
- `number w (0)` The maximum width of each line, in meters.  Use zero for unlimited.
- `number h (.1)` The height of each line, in meters.
- `number angle (0)` The rotation of the cube around its rotation axis, in radians.
- `number ax (0)` The x coordinate of the cube's axis of rotation.
- `number ay (1)` The y coordinate of the cube's axis of rotation.
- `number az (0)` The z coordinate of the cube's axis of rotation.

### Returns

Nothing

### Notes

Unicode text is supported.  Use `\n` to add a line break.

### See also

- `lovr.graphics.setFont`
- `lovr.graphics.getFont`
- `lovr.graphics.newFont`
- `Font`
