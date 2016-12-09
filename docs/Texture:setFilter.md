<!--
category: reference
-->

Texture:setFilter
===

Set the `FilterMode` used by the texture when upsampling or downsampling.  The default mode is
`linear`.

    texture:setFilter(min, mag)

### Arguments

- `FilterMode min` The filter mode used for minification.
- `FilterMode mag (min)` The filter mode used for magnification.

### Returns

See also
---

- `Texture:getFilter`
