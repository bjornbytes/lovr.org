<!--
category: reference
-->

Shader:hasUniform
===

Check whether a Shader has a particular uniform variable.

    present = shader:hasUniform(uniform)

### Arguments

- `string uniform` The name of the uniform variable.

### Returns

- `boolean present` Whether the shader has the specified uniform.

Notes
---

If a uniform variable is defined but unused in the shader, the shader compiler will optimize it out
and the uniform will not *report* itself as present.
