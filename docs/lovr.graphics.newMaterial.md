<!--
category: reference
-->

lovr.graphics.newMaterial
===

Creates a new Material.  Materials are sets of colors, textures, and other parameters that affect
the appearance of objects.  They can be applied to `Model`s, `Mesh`es, and most graphics primitives
accept a Material as an optional first argument.

    material = lovr.graphics.newMaterial()

### Arguments

None

### Returns

- `Material material` The new empty material.

---

    material = lovr.graphics.newMaterial(texture, r, g, b, a)

### Arguments

- `Texture texture` The diffuse texture for the material.
- `number r (1)` The red component of the diffuse color.
- `number g (1)` The green component of the diffuse color.
- `number b (1)` The blue component of the diffuse color.
- `number a (1)` The alpha component of the diffuse color.

### Returns

- `Material material` The new material.

---

    material = lovr.graphics.newMaterial(r, g, b, a)

### Arguments

- `number r (1)` The red component of the diffuse color.
- `number g (1)` The green component of the diffuse color.
- `number b (1)` The blue component of the diffuse color.
- `number a (1)` The alpha component of the diffuse color.

### Returns

- `Material material` The new material.

See also
---

- `Material`
- `Model:setMaterial`
- `Mesh:setMaterial`
