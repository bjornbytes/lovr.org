<!--
category: reference
-->

lovr.graphics.newShader
---

Create a new shader.

    shader = lovr.graphics.newShader(vertex, fragment)

#### Arguments

- `string vertex (nil)` The code or filename of the vertex shader.  If `nil`, the default vertex shader is
  used.
- `string fragment (nil)` The code or filename of the fragment shader.  If `nil`, the default fragment shader
  is used.

#### Returns

- `Shader shader` The new shader object.
