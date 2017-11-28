<!--
category: reference
-->

Mesh
===

A mesh is a drawable object that stores an arbitrary list of vertices.  It is flexible and
efficient, but is a little more difficult to use.

Functions
---

<table>
<tr>
  <td class="pre">lovr.graphics.newMesh</td>
  <td>Create a Mesh.</td>
</tr>

<tr>
  <td class="pre">Mesh:draw</td>
  <td>Draw a Mesh.</td>
</tr>

<tr>
  <td class="pre">Mesh:drawInstanced</td>
  <td>Draw multiple copies of a Mesh in an optimized way.</td>
</tr>

<tr>
  <td class="pre">Mesh:getMaterial</td>
  <td>Get the Material applied to the Mesh.</td>
</tr>

<tr>
  <td class="pre">Mesh:setMaterial</td>
  <td>Set the Material to use when rendering the Mesh.</td>
</tr>

<tr>
  <td class="pre">Mesh:getDrawMode</td>
  <td>Get the current draw mode of a Mesh, which controls how vertices are connected together.</td>
</tr>

<tr>
  <td class="pre">Mesh:getDrawRange</td>
  <td>Get the current draw range of a Mesh, a subset of vertices that are drawn.</td>
</tr>

<tr>
  <td class="pre">Mesh:getVertex</td>
  <td>Get a single vertex in the Mesh.</td>
</tr>

<tr>
  <td class="pre">Mesh:getVertexAttribute</td>
  <td>Get a specific attribute of a single vertex in the Mesh.</td>
</tr>

<tr>
  <td class="pre">Mesh:getVertexCount</td>
  <td>Get the number of vertices the Mesh can hold.</td>
</tr>

<tr>
  <td class="pre">Mesh:getVertexMap</td>
  <td>Get the current vertex map of the Mesh.</td>
</tr>

<tr>
  <td class="pre">Mesh:setDrawMode</td>
  <td>Set the draw mode of the Mesh, controlling how vertices are connected together.</td>
</tr>

<tr>
  <td class="pre">Mesh:setDrawRange</td>
  <td>Set the draw range of the Mesh, causing only a subset of the vertices to be drawn.</td>
</tr>

<tr>
  <td class="pre">Mesh:setVertex</td>
  <td>Update a single vertex in the Mesh.</td>
</tr>

<tr>
  <td class="pre">Mesh:setVertexAttribute</td>
  <td>Update a specific attribute of a single vertex in the Mesh.</td>
</tr>

<tr>
  <td class="pre">Mesh:setVertexMap</td>
  <td>Set the vertex map of the Mesh, allowing you to reorder and reuse vertices.</td>
</tr>

<tr>
  <td class="pre">Mesh:setVertices</td>
  <td>Update all vertices of the Mesh at once.</td>
</tr>
</table>

Types
---

<table>
<tr>
  <td class="pre">MeshDrawMode</td>
  <td>The ways that vertices in a Mesh can be connected together to form shapes.</td>
</tr>

<tr>
  <td class="pre">MeshUsage</td>
  <td>An optimization hint to tell the graphics card how often the data in a Mesh will be changed.</td>
</tr>
</table>

Mesh Formats
---

Each vertex in a mesh can hold several pieces of data.  For example, you might want a vertex to
keep track of its position, color, and a weight.  Each one of these pieces of information is called
a vertex **attribute**.  A vertex attribute must have a name, a type, and a size.  Here's what the
"position" attribute would look like as a Lua table:

    { 'vPosition', 'float', 3 } -- 3 floats for x, y, and z

Every vertex in a Mesh must have the same set of attributes.  We call this set of attributes the
**format** of the Mesh, and it's specified as a simple table of attributes.  For example, we could
represent the format described above as:

    {
      { 'vPosition', 'float', 3 },
      { 'vColor',    'byte',  4 },
      { 'vWeight',   'int',   1 }
    }

When creating a Mesh, you can give it any format you want, or use the default.  The default Mesh
format looks like this:

    {
      { 'lovrPosition', 'float', 3 },
      { 'lovrNormal',   'float', 3 },
      { 'lovrTexCoord', 'float', 2 }
    }

Great, so why do we go through the trouble of naming everything in our vertex and saying what type
and size it is?  The cool part is that we can access this data in a Shader.  We can write a vertex
Shader that has `in` variables for every vertex attribute in our Mesh:

    in vec3 vPosition;
    in vec4 vColor;
    in int vWeight;

    vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
      // Here we can access the vPosition, vColor, and vWeight of each vertex in the mesh!
    }

Specifying custom vertex data is really powerful and is often used for lighting, animation, and more!
