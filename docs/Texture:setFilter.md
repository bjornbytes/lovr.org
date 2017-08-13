<!--
category: reference
-->

Texture:setFilter
===

Set the `FilterMode` used by the texture.  The default can be set using
`lovr.graphics.setDefaultFilter`.

    texture:setFilter(min, mag)

### Arguments

- `FilterMode mode` The filter mode to use.
- `number anisotropy` The level of anisotropy to use, when using anisotropic filtering.

### Returns

Nothing

See also
---

- `Texture:getFilter`
- `lovr.graphics.getDefaultFilter`
- `lovr.graphics.setDefaultFilter`
