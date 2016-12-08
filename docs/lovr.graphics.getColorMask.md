<!--
category: reference
-->

lovr.graphics.getColorMask
---

Returns the active color channels.  If a color channel is active, then drawing operations will
affect that particular channel.  By default, all color channels are active.

    r, g, b, a = lovr.graphics.getColorMask()

#### Arguments

- None

#### Returns

- `boolean r` Whether or not the red channel is enabled.
- `boolean g` Whether or not the green channel is enabled.
- `boolean b` Whether or not the blue channel is enabled.
- `boolean a` Whether or not the alpha channel is enabled.
