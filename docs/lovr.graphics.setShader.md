<!--
category: reference
-->

lovr.graphics.setShader
===

Sets or clears the Shader used for drawing.

---

    lovr.graphics.setShader(shader)

### Arguments

- `Shader shader` The shader to use.

### Returns

Nothing

Notes
---

Sets the current shader.  All drawing operations will pass through the specified Shader until the
next call to `lovr.graphics.setShader`.

---

    lovr.graphics.setShader()

### Arguments

None

### Returns

Nothing

Notes
---

- Disables shaders, allowing unfiltered drawing operations.
