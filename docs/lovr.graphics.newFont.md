<!--
category: reference
-->

lovr.graphics.newFont
===

Creates a new font from a ttf file.

---

    font = lovr.graphics.newFont(filename, size)

### Arguments

- `string filename` The filename of the font.
- `string size (32)` The size of the font, in pixels.  Larger sizes will lead to sharper text at the
  cost of performance.

### Returns

- `Font font` The new Font.

---

    font = lovr.graphics.newFont(size)

### Arguments

- `number size (32)` The size of the font, in pixels.  Larger sizes will lead to sharper text at the
  cost of performance.

### Returns

- `Font font` A new instance of the default font (Cabin).

See also
---

- `Font`
