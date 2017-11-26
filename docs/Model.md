<!--
category: reference
-->

Model
===

A Model is a drawable object loaded from a 3D file format.  The supported formats are `obj`, `fbx`,
and `dae` (COLLADA)..  Models will use normals and texture coordinates, if provided.

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
  <td class="pre">Model:getAABB</td>
  <td>Get the axis aligned bounding box of the vertices of the Model.</td>
</tr>
</table>
