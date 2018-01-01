<!--
category: reference
-->

lovr.graphics.newTexture
===

Creates a new texture from a single image file.

---

    texture = lovr.graphics.newTexture(filename, flags)

### Arguments

- `string filename` The filename of the image.
- `table flags ({})` Optional settings for the texture.
  - `boolean flags.linear (false)` Whether or not the texture is in the linear color space.  This
    flag is only used if gamma correct rendering is enabled, and should be set to true for textures
    that don't include color information, such as normal maps.  See `lovr.graphics.isGammaCorrect`
    for more info.

### Returns

- `Texture texture` The new Texture.

---

Creates a new cubemap texture from 6 images.  It can be used as a skybox using
`lovr.graphics.skybox`.

    texture = lovr.graphics.newTexture(right, left, top, bottom, back, front, flags)

### Arguments

- `string right` The filename of the image for the positive x direction.
- `string left` The filename of the image for the negative x direction.
- `string top` The filename of the image for the positive y direction.
- `string bottom` The filename of the image for the negative y direction.
- `string back` The filename of the image for the positive z direction.
- `string front` The filename of the image for the negative z direction.
- `table flags ({})` Optional settings for the texture.
  - `boolean flags.linear (false)` Whether or not the images are in the linear color space.  This
    flag is only used if gamma correct rendering is enabled, and should be set to true for textures
    that don't include color information, such as normal maps.  See `lovr.graphics.isGammaCorrect`
    for more info.

### Returns

- `Texture texture` The new cubemap Texture.

---

Create a new texture from a table of images.

    texture = lovr.graphics.newTexture(images, flags)

### Arguments

- `table images` The table of image filenames.  Either 1 or 6 can be provided, as above.
- `table flags ({})` Optional settings for the texture.
  - `boolean flags.linear (false)` Whether or not the images are in the linear color space.  This
    flag is only used if gamma correct rendering is enabled, and should be set to true for textures
    that don't include color information, such as normal maps.  See `lovr.graphics.isGammaCorrect`
    for more info.

### Returns

- `Texture texture` The new Texture.
