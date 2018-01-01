<!--
category: reference
-->

lovr.graphics.stencil
===

Renders to the stencil buffer using a function.

    lovr.graphics.stencil(callback, action, replaceValue, keepValues)

### Arguments

- `function callback` The function that will be called to render to the stencil buffer.
- `StencilAction action ("replace")` How to modify the stencil value of pixels that are rendered to.
- `number replaceValue (1)` If `action` is "replace", this is the value that pixels are replaced
  with.
- `boolean keepValues (false)` If false, the stencil buffer will be cleared before rendering.

### Returns

Nothing

Notes
---

Stencil values are between 0 and 255.

See also
---

- `lovr.graphics.getStencilTest`
- `lovr.graphics.setStencilTest`
