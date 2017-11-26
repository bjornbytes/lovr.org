<!--
category: reference
-->

Model
===

A Model is a drawable object loaded from a 3D file format.  The supported formats are `obj`, `fbx`,
`dae` (COLLADA), and `gltf`.  Loading a Model will load its normals, texture coordinates, vertex
colors, referenced materials, and animations.

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
  <td class="pre">Model:getMaterial</td>
  <td>Get the Material applied to the Model.</td>
</tr>

<tr>
  <td class="pre">Model:setMaterial</td>
  <td>Set the Material to use when rendering the Model.</td>
</tr>

<tr>
  <td class="pre">Model:getAABB</td>
  <td>Get the axis aligned bounding box of the vertices of the Model.</td>
</tr>
</table>
