<!--
category: reference
-->

Shader
---

Shaders are GLSL programs that transform the way vertices and pixels show up on the screen.  They
can be used for lighting, postprocessing, particles, animation, and much more.  You can use
`lovr.graphics.setShader` to change the active Shader.

<table>
<tr>
  <td class="pre">lovr.graphics.newShader</td>
  <td>Create a new Shader.</td>
</tr>

<tr>
  <td class="pre">Shader:send</td>
  <td>Update a uniform variable of the Shader.</td>
</tr>
</table>

### Default Shader Code

The default vertex shader:

    vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
      return projection * transform * vertex;
    }

The default fragment shader:

    vec4 color(vec4 graphicsColor, sampler2D image, vec2 uv) {
      return graphicsColor * texture(image, uv);
    }
