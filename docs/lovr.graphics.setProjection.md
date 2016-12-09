<!--
category: reference
-->

lovr.graphics.setProjection
===

Sets the camera projection.  The projection settings define the camera frustum: How wide of a field
of view the camera has and how far away the near and far clipping planes are.  If an object is
outside of this field of view, closer than the near clipping plane, or further away than the far
clipping plane, then it will not be rendered.

    lovr.graphics.setProjection(near, far, fov)

### Arguments

- `number near` How far away the near clipping plane is, in meters.
- `number far` How far away the far clipping plane is, in meters.
- `number fov` The vertical field of view of the camera, in radians.

### Returns

Nothing
