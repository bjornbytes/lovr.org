<!--
category: reference
-->

lovr.graphics.skybox
===

Render a skybox from a texture.  Two common kinds of skybox textures are supported: A rectangular
texture with an equirectangular projection can be used, or a "cubemap" texture created from 6
images.

    lovr.graphics.skybox(texture, angle, ax, ay, az)

### Arguments

- `Texture texture` The texture to use.
- `number angle (0)` How much to rotate the skybox around its axis of rotation.
- `number ax (0)` The x coordinate of the axis of rotation.
- `number ay (1)` The y coordinate of the axis of rotation.
- `number az (0)` The z coordinate of the axis of rotation.

### Returns

Nothing

Notes
---

It is common to use the headset's orientation as the skybox rotation so the skybox moves around as
the player moves their head.
