<!--
category: reference
-->

BlendMode
===

Blend modes control how overlapping pixels are blended together, similar to layers in Photoshop.

Values
---

- `alpha` Normal blending where the alpha value controls how the colors are blended.
- `add` Colors are added to what is already on the screen.
- `subtract` The colors are subtracted from what's already on the screen.
- `multiply` The colors are multiplied by what's already on the screen.
- `lighten` The maximum value from each color channel is used, resulting in a lightening effect.
- `darken` The minimum value from each color channel is used, resulting in a darkening effect.
- `screen` The opposite of `multiply`.
- `replace` The colors will replace what is already on the screen.

See also
---

- `BlendAlphaMode`
- `lovr.graphics.getBlendMode`
- `lovr.graphics.setBlendMode`
