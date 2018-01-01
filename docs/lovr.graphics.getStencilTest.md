<!--
category: reference
-->

lovr.graphics.getStencilTest
===

Returns the current stencil test.  The stencil test lets you mask out pixels that meet certain
criteria, based on the contents of the stencil buffer.  The stencil buffer can be modified using
`lovr.graphics.stencil`.  After rendering to the stencil buffer, the stencil test can be set to
control how subsequent drawing functions are masked by the stencil buffer.

    compareMode, compareValue = lovr.graphics.getStencilTest()

### Arguments

None

### Returns

- `CompareMode compareMode` The comparison method used to decide if a pixel should be visible, or
  `nil` if the stencil test is disabled.
- `number compareValue` The value stencil values are compared against, or `nil` if the stencil test
  is disabled.

Notes
---

Stencil values are between 0 and 255.

See also
---

- `lovr.graphics.setStencilTest`
- `lovr.graphics.stencil`
