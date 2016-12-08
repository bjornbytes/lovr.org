<!--
category: reference
-->

Buffer
---

A buffer is a drawable object that stores an arbitrary list of vertices.  It is flexible and
efficient, but is a little more difficult to use.

### Functions

<table>
<tr>
  <td class="pre">lovr.graphics.newBuffer</td>
  <td>Create a Buffer.</td>
</tr>

<tr>
  <td class="pre">Buffer:draw</td>
  <td>Draw a Buffer.</td>
</tr>

<tr>
  <td class="pre">Buffer:getDrawMode</td>
  <td>Get the current draw mode of a Buffer, which controls how vertices are connected together.</td>
</tr>

<tr>
  <td class="pre">Buffer:getDrawRange</td>
  <td>Get the current draw range of a Buffer, a subset of vertices that are drawn.</td>
</tr>

<tr>
  <td class="pre">Buffer:getTexture</td>
  <td>Get the current texture used when drawing the Buffer.</td>
</tr>

<tr>
  <td class="pre">Buffer:getVertex</td>
  <td>Get a single vertex in the Buffer.</td>
</tr>

<tr>
  <td class="pre">Buffer:getVertexAttribute</td>
  <td>Get a specific attribute of a single vertex in the Buffer.</td>
</tr>

<tr>
  <td class="pre">Buffer:getVertexCount</td>
  <td>Get the number of vertices the Buffer can hold.</td>
</tr>

<tr>
  <td class="pre">Buffer:getVertexMap</td>
  <td>Get the current vertex map of the Buffer.</td>
</tr>

<tr>
  <td class="pre">Buffer:setDrawMode</td>
  <td>Set the draw mode of the Buffer, controlling how vertices are connected together.</td>
</tr>

<tr>
  <td class="pre">Buffer:setDrawRange</td>
  <td>Set the draw range of the Buffer, causing only a subset of the vertices to be drawn.</td>
</tr>

<tr>
  <td class="pre">Buffer:setTexture</td>
  <td>Set the texture used when drawing the Buffer.</td>
</tr>

<tr>
  <td class="pre">Buffer:setVertex</td>
  <td>Update a single vertex in the Buffer.</td>
</tr>

<tr>
  <td class="pre">Buffer:setVertexAttribute</td>
  <td>Update a specific attribute of a single vertex in the Buffer.</td>
</tr>

<tr>
  <td class="pre">Buffer:setVertexMap</td>
  <td>Set the vertex map of the Buffer, allowing you to reorder and reuse vertices.</td>
</tr>

<tr>
  <td class="pre">Buffer:setVertices</td>
  <td>Update all vertices of the Buffer at once.</td>
</tr>
</table>

### Types

<table>
<tr>
  <td class="pre">BufferDrawMode</td>
  <td>The ways that vertices in a Buffer can be connected together to form shapes.</td>
</tr>

<tr>
  <td class="pre">BufferUsage</td>
  <td>An optimization hint to tell the graphics card how often the data in a Buffer will be changed.</td>
</tr>
</table>

### Buffer Formats

Each vertex in a buffer can hold several pieces of data.  For example, you might want a vertex to
keep track of its position, color, and a weight.  Each one of these pieces of information is called
a vertex **attribute**.  A vertex attribute must have a name, a type, and a size.  Here's what the
"position" attribute would look like as a Lua table:

    { 'vPosition', 'float', 3 } -- 3 floats for x, y, and z

Every vertex in a Buffer must have the same set of attributes.  We call this set of attributes the
**format** of the Buffer, and it's specified as a simple table of attributes.  For example, we could
represent the format described above as:

    {
      { 'vPosition', 'float', 3 },
      { 'vColor',    'byte',  4 },
      { 'vWeight',   'int',   1 }
    }

When creating a Buffer, you can give it any format you want, or use the default.  The default Buffer
format looks like this:

    {
      { 'lovrPosition', 'float', 3 },
      { 'lovrNormal',   'float', 3 },
      { 'lovrTexCoord', 'float', 2 }
    }

Great, so why do we go through the trouble of naming everything in our vertex and saying what type
and size it is?  The cool part is that we can access this data in a Shader.  We can write a vertex
Shader that has `in` variables for every vertex attribute in our Buffer:

    in vec3 vPosition;
    in vec4 vColor;
    in int vWeight;

    vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
      // Here we can access the vPosition, vColor, and vWeight of each vertex in the buffer!
    }

Specifying custom vertex data is really powerful and is often used for lighting, animation, and more!
