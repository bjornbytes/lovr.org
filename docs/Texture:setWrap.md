<!--
category: reference
-->

Texture:setWrap
===

Set the wrap mode of a texture.  The wrap mode controls how the texture is sampled when texture
coordinates lie outside the usual 0 - 1 range.  The default for both directions is `repeat`.

    texture:setWrap(horizontal, vertical)

### Arguments

- `WrapMode horizontal` How the texture should wrap horizontally.
- `WrapMode vertical` How the texture should wrap vertically.

### Returns

Nothing

See also
---

- `Texture:getWrap`
