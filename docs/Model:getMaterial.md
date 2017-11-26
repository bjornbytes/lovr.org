<!--
category: reference
-->

Model:getMaterial
===

Get the `Material` to use when drawing the Model.  If `nil`, the default material(s) that are
embedded or referenced in the model file will be used.

    material = model:getMaterial()

### Arguments

None

### Returns

- `Material material` The material applied to the Model, or `nil` if the default material(s) are
  used.

See also
---

- `Model:setMaterial`
