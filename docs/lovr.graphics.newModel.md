<!--
category: reference
-->

lovr.graphics.newModel
===

Creates a new Model from a file.  Supported 3D formats are COLLADA (.dae), FBX, and OBJ.

    model = lovr.graphics.newModel(filename)

### Arguments

- `string filename` The filename of the model.

### Returns

- `Model model` The new Model.

---

Create a new Model with a Texture applied.

    model = lovr.graphics.newModel(filename, texture)

### Arguments

- `string filename` The filename of the model.
- `string texture` The filename of the texture to apply to the model.

### Returns

- `Model model` The new Model.
