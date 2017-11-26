<!--
category: reference
-->

Model:setMaterial
===

Set the `Material` to use when drawing the Model.  If `nil`, the default material(s) that are
embedded or referenced in the model file will be used.

    model:setMaterial(material)

### Arguments

- `Material material` The material to use when rendering the model, or `nil` to use the default.

### Returns

Nothing

See also
---

- `Model:getMaterial`
