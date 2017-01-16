<!--
category: reference
-->

Texture:renderTo
===

Render to a texture using a function.

    texture:renderTo(callback)

### Arguments

- `function callback` The function used to render to the texture.  Normal `lovr.graphics` functions
can be used inside the callback to change the contents of the texture.

### Returns

Nothing

Notes
---

1. Textures created from an image can't be rendered to.  See `lovr.graphics.newTexture` for details on
creating an empty texture with a width and height.
1. Make sure you clear the contents of the texture before rendering using `lovr.graphics.clear`.
Otherwise there might be garbage data in the texture.
