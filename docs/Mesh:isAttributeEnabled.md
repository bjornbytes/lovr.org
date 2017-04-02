<!--
category: reference
-->

Mesh:isAttributeEnabled
===

Get whether or not a vertex attribute is enabled for this Mesh.

    enabled = mesh:isAttributeEnabled(attribute)

### Arguments

- `string attribute` The name of the attribute.

### Returns

- `boolean enabled` Whether or not the attribute is enabled when drawing the Mesh.

Notes
---

Meshes without a custom format will have `lovrPosition`, `lovrNormal`, `lovrTexCoord`.

See also
---

- `Mesh:setAttributeEnabled`
