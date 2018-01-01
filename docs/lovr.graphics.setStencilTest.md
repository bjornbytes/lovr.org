<!--
category: reference
-->

lovr.graphics.setStencilTest
===

Sets the stencil test.  The stencil test lets you mask out pixels that meet certain criteria, based
on the contents of the stencil buffer.  The stencil buffer can be modified using
`lovr.graphics.stencil`.  After rendering to the stencil buffer, the stencil test can be set to
control how subsequent drawing functions are masked by the stencil buffer.

    lovr.graphics.setStencilTest(compareMode, compareValue)

### Arguments

- `CompareMode compareMode` The comparison method to use to decide if a pixel should be visible.
- `number compareValue` The value to compare stencil values to.

### Returns

Nothing

---

Disables the stencil test.

    lovr.graphics.setStencilTest()

### Arguments

None

### Returns

Nothing

Notes
---

Stencil values are between 0 and 255.

See also
---

- `lovr.graphics.getStencilTest`
- `lovr.graphics.stencil`
