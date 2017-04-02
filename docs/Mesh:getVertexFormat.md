<!--
category: reference
-->

Mesh:getVertexFormat
===

Get the format table of the Mesh's vertices.

    format = mesh:getVertexFormat()

### Arguments

None

### Returns

- `table format` The table of vertex attributes.  Each attribute is a table containing the name
  of the attribute (string), the data type (string), and the number of components of the attribute
  (number).
