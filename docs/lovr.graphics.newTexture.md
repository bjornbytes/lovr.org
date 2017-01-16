<!--
category: reference
-->

lovr.graphics.newTexture
===

Creates a new texture.  The texture can be loaded from an image file, or it can be created as an
empty render target.

---

    texture = lovr.graphics.newTexture(filename)

### Arguments

- `string filename` The filename of the image.

### Returns

- `Texture texture` The new Texture.

---

    texture = lovr.graphics.newTexture(width, height, projection, msaa)

### Arguments

- `number width` The width of the texture, in pixels.
- `number height` The height of the texture, in pixels.
- `TextureProjection projection (3d)` The type of the projection to use for the Texture.
- `number msaa (0)` The number of samples to use for multisample antialiasing.  A higher number will
  make things look prettier at the cost of performance.  Set to 0 to disable antialiasing.

### Returns

- `Texture texture` The new Texture.  To render to it, use `Texture:renderTo`.
