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
  <td class="pre">Model:drawInstanced</td>
  <td>Draw multiple copies of a Model in an optimized way.</td>
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
  <td class="pre">Model:getAnimator</td>
  <td>Get the Animator attached to the Model.</td>
</tr>

<tr>
  <td class="pre">Model:setAnimator</td>
  <td>Attach an Animator to a Model.</td>
</tr>

<tr>
  <td class="pre">Model:getMesh</td>
  <td>Get the underlying Mesh object for a Model.</td>
</tr>

<tr>
  <td class="pre">Model:getAABB</td>
  <td>Get the axis aligned bounding box of the vertices of the Model.</td>
</tr>
</table>
