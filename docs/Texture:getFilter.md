<!--
category: reference
-->

Texture:getFilter
===

Get the current `FilterMode` used by the texture.

    mode, anisotropy = texture:getFilter()

### Arguments

None

### Returns

- `FilterMode mode` The filtering mode for the texture.
- `number anisotropy` If the filter mode is `anisotropic`, returns the level of anisotropy.
  Otherwise, this will be `nil`.

See also
---

- `Texture:setFilter`
