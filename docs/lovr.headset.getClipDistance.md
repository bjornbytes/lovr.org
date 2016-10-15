lovr.headset.getClipDistance
---

Returns the near and far clipping planes used to render to the headset.  Objects closer than the
near clipping plane or further than the far clipping plane will be clipped out of view.

    near, far = lovr.headset.getClipDistance()

#### Arguments

- None

#### Returns

- `number near` The distance of the near clipping plane, in meters.
- `number far` The distance of the far clipping plane, in meters.
