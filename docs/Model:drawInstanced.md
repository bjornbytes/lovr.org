<!--
category: reference
-->

Model:drawInstanced
===

Draws a model multiple times.  This is much faster than drawing `Model:draw` more than once.

    model:draw(instances, x, y, z, size, angle, ax, ay az)

### Arguments

- `number instances (1)` The number of copies to draw.
- `number x (0)` The x coordinate to draw the model at.
- `number y (0)` The y coordinate to draw the model at.
- `number z (0)` The z coordinate to draw the model at.
- `number size (1)` The scale factor of the model.
- `number angle (0)` The angle to rotate the model around its axis of rotation.
- `number ax (0)` The x component of the axis of rotation.
- `number ay (1)` The y component of the axis of rotation.
- `number az (0)` The z component of the axis of rotation.

### Returns

Nothing

---

Draws multiple copies of a model using a transform.

    model:draw(instances, transform)

### Arguments

- `number instances (1)` The number of copies to draw.
- `Transform transform` The Transform to apply to the model.

### Returns

Nothing

Notes
---

By default, the Meshes will all be drawn on top of each other.  To get the drawn copies to appear in
different places, you can use the `gl_InstanceID` variable in a `Shader`.  The first instance will
pass `0` as the instance ID, the second instance will pass `1` as the instance ID, etc.  You can
use an array of `mat4` variables and access the array using the supplied instance ID to specify a
list of positions to draw the instances at.
