<!--
category: reference
-->

Mesh:setAttributeEnabled
===

Enable or disable a vertex attribute.  Disabling a vertex attribute will reduce the amount of data
that needs to be sent to a Shader.

    mesh:setAttributeEnabled(attribute, enabled)

### Arguments

- `string attribute` The name of the attribute.
- `boolean enabled` Whether or not the attribute should be enabled when drawing the Mesh.

### Returns

Nothing

Notes
---

Meshes without a custom format will have `lovrPosition`, `lovrNormal`, `lovrTexCoord`.

See also
---

- `Mesh:isAttributeEnabled`
