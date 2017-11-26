<!--
category: reference
-->

Shader
===

Shaders are GLSL programs that transform the way vertices and pixels show up on the screen.  They
can be used for lighting, postprocessing, particles, animation, and much more.  You can use
`lovr.graphics.setShader` to change the active Shader.

<table>
<tr>
  <td class="pre">lovr.graphics.newShader</td>
  <td>Create a new Shader.</td>
</tr>

<tr>
  <td class="pre">Shader:hasUniform</td>
  <td>Check whether a Shader has a uniform variable.</td>
</tr>

<tr>
  <td class="pre">Shader:send</td>
  <td>Update a uniform variable of the Shader.</td>
</tr>
</table>

Default Shader Code
---

The default vertex shader:

    vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
      return projection * transform * vertex;
    }

The default fragment shader:

    vec4 color(vec4 graphicsColor, sampler2D image, vec2 uv) {
      return graphicsColor * texture(image, uv);
    }

Shader Headers
---

When you create a shader, the following headers are prepended to the source, giving you convenient
access to a default set of uniform variables and vertex attributes:

Vertex header:

    // Vertex attributes
    in vec3 lovrPosition;
    in vec3 lovrNormal;
    in vec2 lovrTexCoord;
    out vec2 texCoord;

    // Matrix uniforms
    uniform mat4 lovrModel;
    uniform mat4 lovrView;
    uniform mat4 lovrProjection;
    uniform mat4 lovrTransform; // The ModelView matrix
    uniform mat3 lovrNormalMatrix;

Fragment header:

    in vec2 texCoord;
    out vec4 lovrFragColor;
    uniform vec4 lovrColor; // The color set with lovr.graphics.setColor
    uniform sampler2D lovrTexture;
