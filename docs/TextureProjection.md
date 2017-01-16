<!--
category: reference
-->

TextureProjection
===

When creating Textures to be used as render targets, they can be created in either "2d" or "3d"
mode.  2D mode is good for 2D user interfaces or postprocessing, whereas 3d is useful for portals,
weapon scopes, mirrors, and other situations where 3D content needs to be rendered.

Values
---

- `2d` Optimize the texture for rendering 2d content using an orthographic projection.
- `3d` Optimize the texture for rendering 3d content using a perspective projection.
