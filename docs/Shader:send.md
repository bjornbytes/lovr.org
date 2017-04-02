<!--
category: reference
-->

Shader:send
===

Update a uniform variable of a Shader.

    shader:send(uniform, value)

### Arguments

- `string uniform` The name of the uniform variable.
- `* value` The new value of the uniform variable.

### Returns

Nothing

Notes
---

The shader does not need to be active to update its uniforms.  However, the types must match up.
Uniform variables declared as `float`s must be sent a single number, whereas uniforms declared as
`vec4`s must be sent a table containing 4 numbers, etc.  Note that uniforms declared as `mat4`s can
be sent a `Transform` object.

Example
---

Updating a `vec3` uniform variable

    function lovr.load()
      shader = lovr.graphics.newShader [[
        uniform vec3 offset;
        vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
          vertex.xyz += offset;
          return projection * transform * vertex;
        }
      ]]

      shader:send('offset', { .3, .7, 0 })
    end
