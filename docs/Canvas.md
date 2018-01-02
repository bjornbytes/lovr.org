<!--
category: reference
-->

Canvas
===

A Canvas is also known as a framebuffer or render-to-texture.  It allows you to render to an
offscreen canvas and postprocess or transform the results later.

Canvases extend Textures, so Canvases can be used as textures in materials or rendered as fullscreen
quads just like textures can, and they inherit all Texture functions.

<table>
<tr>
  <td class="pre">lovr.graphics.newCanvas</td>
  <td>Create a new Canvas.</td>
</tr>

<tr>
  <td class="pre">Canvas:renderTo</td>
  <td>Render to the Canvas using a function.</td>
</tr>

<tr>
  <td class="pre">Canvas:getFormat</td>
  <td>Get the format of the Canvas.</td>
</tr>

<tr>
  <td class="pre">Canvas:getMSAA</td>
  <td>Get the number of antialiasing samples to use when rendering to the Canvas.</td>
</tr>
</table>
