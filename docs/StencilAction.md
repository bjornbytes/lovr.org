<!--
category: reference
-->

StencilAction
===

How to modify pixels in the stencil buffer when using `lovr.graphics.stencil`.

Values
---

- `replace` Stencil values will be replaced with a custom value.
- `increment` Stencil values will increment every time they are rendered to.
- `decrement` Stencil values will decrement every time they are rendered to.
- `incrementwrap` Similar to `increment`, but the stencil value will be set to 0 if it exceeds 255.
- `decrementwrap` Similar to `decrement`, but the stencil value will be set to 255 if it drops below
  0.
- `invert` Stencil values will be bitwise inverted every time they're rendered top.
