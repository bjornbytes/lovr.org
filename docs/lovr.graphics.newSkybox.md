<!--
category: reference
-->

lovr.graphics.newSkybox
===

Creates a new `Skybox` from a set of 6 images.

---

    skybox = lovr.graphics.newSkybox(right, left, top, bottom, back, front)

### Arguments

- `string right` The filename of the image for the right face of the skybox.
- `string left` The filename of the image for the left face of the skybox.
- `string top` The filename of the image for the top face of the skybox.
- `string bottom` The filename of the image for the bottom face of the skybox.
- `string back` The filename of the image for the back face of the skybox.
- `string front` The filename of the image for the front face of the skybox.

### Returns

- `Skybox skybox` The new skybox object.

---

    skybox = lovr.graphics.newSkybox(images)

### Arguments

- `table images` A table containing the images, as described above.

### Returns

- `Skybox skybox` The new skybox object.
