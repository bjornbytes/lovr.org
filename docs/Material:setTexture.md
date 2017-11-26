<!--
category: reference
-->

Material:setTexture
===

Set a texture property for a Material.  Different types of textures are supported for different
lighting parameters.  If set to `nil`, textures default to a blank white texture.

    Material:setTexture(textureType, texture)

### Arguments

- `MaterialTexture textureType (diffuse)` The type of texture to set.
- `Texture texture` The texture to apply.

### Returns

Nothing

---

Set the diffuse texture.

    Material:setTexture(texture)

### Arguments

- `Texture texture` The diffuse texture to apply.

### Returns

Nothing

See also
---

- `Material:getTexture`
- `MaterialTexture`
- `lovr.graphics.newTexture`
