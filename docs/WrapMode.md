WrapMode
---

The method used to render textures when texture coordinates are outside of the 0-1 range.

#### Values

- `clamp` The pixels that fall outside of the range will take on the value of the pixels at the edge
  of the texture.
- `repeat` The texture repeat.
- `mirroredrepeat` The texture will repeat, mirroring its appearance each time it repeats.
- `clampzero` Pixels outside of 0-1 will appear black.
