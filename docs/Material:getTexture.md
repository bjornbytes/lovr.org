<!--
category: reference
-->

Material:getTexture
===

Get a texture property for a Material.  Different types of textures are supported for different
lighting parameters.  If unset, textures default to a blank white texture.

    texture = Material:getTexture(textureType)

### Arguments

- `MaterialTexture textureType (diffuse)` The type of texture to get.

### Returns

- `Texture texture` The texture that is currently set, or `nil` if no texture is set.

See also
---

- `Material:setTexture`
- `MaterialTexture`
- `lovr.graphics.newTexture`
