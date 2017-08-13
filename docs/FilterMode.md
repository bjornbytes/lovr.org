<!--
category: reference
-->

FilterMode
===

The method used to sample a texture.  Using `nearest` will lead to a pixelated look, whereas using
`anisotropic` will lead to smooth results, especially for textures viewed at a steep angle, like
floor planes.

Values
---

- `nearest` Fast nearest neighbor sampling, usually leads to a pixelated look.
- `bilinear` Smooth pixel sampling.
- `trilinear` Smooth pixel sampling and smooth sampling across mipmap levels.
- `anisotropic` Anisotropic texture filtering.  The level of anisotropy can also be specified when
setting this filter mode.  Gives the best results but is also slower.
