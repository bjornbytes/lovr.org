<!--
category: reference
-->

Texture
===

A Texture is an image that can be applied to `Model`s and `Buffer`s.  Supported file formats
include `.png`, `.jpg`, `.tga`, and `.bmp`.

<table>
<tr>
  <td class="pre">lovr.graphics.newTexture</td>
  <td>Create a new Texture from an image file.</td>
</tr>

<tr>
  <td class="pre">Texture:getDimensions</td>
  <td>Get the dimensions of the Texture.</td>
</tr>

<tr>
  <td class="pre">Texture:getFilter</td>
  <td>Get the current <code>FilterMode</code> used by the Texture.</td>
</tr>

<tr>
  <td class="pre">Texture:getHeight</td>
  <td>Get the height of the Texture.</td>
</tr>

<tr>
  <td class="pre">Texture:getWidth</td>
  <td>Get the width of the Texture.</td>
</tr>

<tr>
  <td class="pre">Texture:getWrap</td>
  <td>Get the current <code>WrapMode</code> of the Texture.</td>
</tr>

<tr>
  <td class="pre">Texture:setFilter</td>
  <td>Set the <code>FilterMode</code> of the Texture, used to control upsampling and downsampling.</td>
</tr>

<tr>
  <td class="pre">Texture:setWrap</td>
  <td>Set the <code>WrapMode</code> of the Texture, used to control texture coordinate wrapping.</td>
</tr>
</table>
