<!--
category: reference
-->

lovr.graphics.getDepthTest
---

Retrieve the current depth test.  The depth test controls how overlapping objects are rendered.
The default is 'less', which causes things farther away from the "camera" to be drawn behind things
that are closer to the camera.

    compareMode = lovr.graphics.getDepthTest()

#### Arguments

None

#### Returns

- `CompareMode compareMode` The current compare mode.
