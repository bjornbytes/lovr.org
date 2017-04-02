<!--
category: reference
-->

Skybox
===

A Skybox is a set of one or more images used to apply a background to a three dimensional scene.
Cubemap Skyboxes can be used, where 6 images are provided to map onto the inside of the cube.  The
cube is drawn around the camera, giving an illusion of a 360-degree background.  Alternatively, a
single panoramic image can be used (sometimes called equirectangular projection) that will wrap
around the camera like a sphere.

<table>
<tr>
  <td class="pre">lovr.graphics.newSkybox</td>
  <td>Create a new Skybox.</td>
</tr>

<tr>
  <td class="pre">Skybox:draw</td>
  <td>Draw a skybox.</td>
</tr>
</table>
