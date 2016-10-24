Skybox:draw
---

Draws a skybox at a specified angle.

    skybox:draw(angle, ax, ay, az)

#### Arguments

- `number angle` The number of radians to rotate the skybox around its angle of rotation.
- `number ax` The x component of the vector representing the axis of rotation.
- `number ay` The y component of the vector representing the axis of rotation.
- `number az` The z component of the vector representing the axis of rotation.

#### Returns

- Nothing

#### Notes

The skybox is rendered without depth, meaning it will be drawn behind all other geometry.
Additionally, a specialized shader is used to render the skybox.  This means it is not possible to
use a custom shader to render skyboxes.
