<!--
category: module
-->

lovr.graphics
===

The `lovr.graphics` module handles rendering graphics to the window.  Although LÖVR is focused on
VR, you can use it to render 3D graphics with or without a VR headset.  If the `lovr.headset` module
is enabled, LÖVR will render to each eye of the headset, otherwise everything will be rendered to a
window on the desktop.

Drawing
---

Simple functions for drawing simple shapes:

<table>
<tr>
  <td class="pre">lovr.graphics.points</td>
  <td>Draw one or more points.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.line</td>
  <td>Draw lines.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.triangle</td>
  <td>Draw a triangle from three points.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.plane</td>
  <td>Draw a plane with a position, size, and orientation.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.cube</td>
  <td>Draw a cube.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.box</td>
  <td>Draw a box.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.cylinder</td>
  <td>Draw a cylinder.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.sphere</td>
  <td>Draw a sphere.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.print</td>
  <td>Draw text.</td>
</tr>
</table>

Transforms
---

Functions to manipulate the coordinate system.  Changing the coordinate system can be useful for
creating a 3D camera, expressing parent-child relationships between entities, or otherwise changing
how objects in the game world are mapped onto the screen.  Note that in LÖVR the negative z axis
is the "forwards" direction and the positive y axis is the "upwards" direction.

<table>
<tr>
  <td class="pre">lovr.graphics.origin</td>
  <td>Reset the coordinate system.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.pop</td>
  <td>Pop the current transform, reverting to the previous transformation.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.push</td>
  <td>Push a copy of the current coordinate transform onto the stack.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.transform</td>
  <td>Transform the coordinate system using a <code>Transform</code> object.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.rotate</td>
  <td>Rotate the coordinate system around an axis.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.scale</td>
  <td>Scale the coordinate system in 3 dimensions.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.translate</td>
  <td>Translate the coordinate system in 3D space.</td>
</tr>
</table>

Objects
---

Several graphics-related objects can be created with the graphics module.  Try to avoid calling
these functions in `lovr.update` or `lovr.draw`, because then the objects will be reloaded every
frame, which can really slow things down!

<table>
<tr>
  <td class="pre">Mesh</td>
  <td class="pre">lovr.graphics.newMesh</td>
  <td>A drawable list of vertices.</td>
</tr>

<tr>
  <td class="pre">Font</td>
  <td class="pre">lovr.graphics.newFont</td>
  <td>A font that can be used to render text.</td>
</tr>

<tr>
  <td class="pre">Model</td>
  <td class="pre">lovr.graphics.newModel</td>
  <td>An asset in a 3D file format such as .obj or .fbx.</td>
</tr>

<tr>
  <td class="pre">Shader</td>
  <td class="pre">lovr.graphics.newShader</td>
  <td>A GLSL program used for lighting, postprocessing, particles, animation, and more.</td>
</tr>

<tr>
  <td class="pre">Skybox</td>
  <td class="pre">lovr.graphics.newSkybox</td>
  <td>A cube wrapped around the camera to give the illusion of a 3D background.</td>
</tr>

<tr>
  <td class="pre">Texture</td>
  <td class="pre">lovr.graphics.newTexture</td>
  <td>An image that can be used to texture Meshes and Models.</td>
</tr>
</table>

State
---

These functions retrieve or manipulate the graphics state.  Graphics state includes things like the
color of drawn objects, the current shader, settings for culling and depth testing, and lots of
other small settings that affect how everything is rendered.  Keep in mind that graphics state is
global, so changes to one piece of state will persist forever until that piece of state is changed
again.  `lovr.graphics.reset` is a handy function that will reset **all** graphics state.

<table>
<tr>
  <td class="pre">lovr.graphics.reset</td>
  <td>Reset all graphics state to their defaults.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.clear</td>
  <td>Clear the screen to the background color.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.present</td>
  <td>Flush the results of drawing operations to the display.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.createWindow</td>
  <td>Create the window.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.getWidth</td>
  <td>Get the width of the window.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.getHeight</td>
  <td>Get the height of the window.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.getDimensions</td>
  <td>Get the dimensions of the window.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.getBackgroundColor</td>
  <td>Get the current background color.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.setBackgroundColor</td>
  <td>Set the background color of the scene.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.getBlendMode</td>
  <td>Get the current blend mode.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.setBlendMode</td>
  <td>Control how colors are blended together.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.getColor</td>
  <td>Get the current color.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.setColor</td>
  <td>Set the color used when drawing.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.isCullingEnabled</td>
  <td>Get whether the graphics system is culling the backface culling of polygons.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.setCullingEnabled</td>
  <td>Enable or disable backface culling.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.getDefaultFilter</td>
  <td>Get the default texture filtering method.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.setDefaultFilter</td>
  <td>Set the default texture filtering method.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.getDepthTest</td>
  <td>Get the current depth test settings.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.setDepthTest</td>
  <td>Set or disable the depth test method, used to control how rendered objects overlap.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.getFont</td>
  <td>Get the active font.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.setFont</td>
  <td>Set the active font.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.getSystemLimits</td>
  <td>Get information about the capabilities of the graphics hardware.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.getLineWidth</td>
  <td>Get the current line width.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.setLineWidth</td>
  <td>Set the width of rendered lines.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.getPointSize</td>
  <td>Get the current point size.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.setPointSize</td>
  <td>Set the size of points drawn with <code>lovr.graphics.points</code>.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.getShader</td>
  <td>Get the current shader in use.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.setShader</td>
  <td>Set or disable the shader.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.getWinding</td>
  <td>Get the current winding order of polygons used for backface culling.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.setWinding</td>
  <td>Set the winding direction of polygons used for backface culling.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.isWireframe</td>
  <td>Get whether or not wireframe mode is enabled.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics.setWireframe</td>
  <td>Enable or disable wireframe rendering.</td>
</tr>
</table>
