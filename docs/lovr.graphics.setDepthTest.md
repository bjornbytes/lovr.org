lovr.graphics.setDepthTest
---

Sets the current depth test.  The depth test controls how overlapping objects are rendered.
The default is 'less', which causes things farther away from the "camera" to be drawn behind things
that are closer to the camera.

    lovr.graphics.getDepthTest(compareMode)

#### Arguments

- `CompareMode compareMode` The new depth test.  `nil` can be passed to disable the depth test
  completely.

#### Returns

Nothing
