<!--
category: reference
-->

Texture
===

A Texture is an image that can be applied to `Material`s.  Supported file formats include
`.png`, `.jpg`, `.tga`, and `.bmp`.  Additionally, three compressed formats are supported: DXT1,
DXT3, and DXT5 (all have the `.dds` extension).  Compressed textures are recommended as they use
less video memory and usually improve performance.

<table>
<tr>
  <td class="pre">lovr.graphics.newTexture</td>
  <td>Create a new Texture.</td>
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
  <td>Set the <code>FilterMode</code> of the Texture, used to control sampling.</td>
</tr>

<tr>
  <td class="pre">Texture:setWrap</td>
  <td>Set the <code>WrapMode</code> of the Texture, used to control texture coordinate wrapping.</td>
</tr>
</table>
