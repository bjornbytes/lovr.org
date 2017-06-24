<!--
category: reference
-->

Model
===

A Model is a drawable object loaded from a 3D file format.  Most common 3D file formats are
supported, such as `3ds`, `blend`, `dae`, `fbx`, `stl`, `obj`, and `glTF`.  Models will use normals
and texture coordinates, if provided.

<table>
<tr>
  <td class="pre">lovr.graphics.newModel</td>
  <td>Load a new Model.</td>
</tr>

<tr>
  <td class="pre">Model:draw</td>
  <td>Draw a Model to the screen.</td>
</tr>

<tr>
  <td class="pre">Model:getTexture</td>
  <td>Get the current texture applied to the Model.</td>
</tr>

<tr>
  <td class="pre">Model:setTexture</td>
  <td>Set the texture of the Model, used when drawing.</td>
</tr>

<tr>
  <td class="pre">Model:getAABB</td>
  <td>Get the axis aligned bounding box of the vertices of the Model.</td>
</tr>
</table>
