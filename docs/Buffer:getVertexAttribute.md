<!--
category: reference
-->

Buffer:getVertexAttribute
---

Get the components of a specific attribute of a vertex in a Buffer.

    ... = buffer:getVertexAttribute(vertex, attribute)

#### Arguments

- `number vertex` The index of the vertex to retrieve the attribute of.
- `number attribute` The index of the attribute to retrieve the components of.

#### Returns

- `...` The components of the attribute of the vertex.

#### Notes

Buffers without a custom format have the vertex position as their first attribute, the normal vector
as the second attribute, and the texture coordinate as the third attribute.

#### See also

- `Buffer:setVertexAttribute`
