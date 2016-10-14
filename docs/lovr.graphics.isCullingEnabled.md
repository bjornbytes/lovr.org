lovr.graphics.isCullingEnabled
---

Returns whether or not culling is active.  Culling is an optimization that avoids rendering the back
face of polygons.  This improves performance by reducing the number of polygons drawn, but requires
that the vertices in triangles are specified in a consistent clockwise or counter clockwise order.
Culling is initially disabled.

    isEnabled = lovr.graphics.isCullingEnabled()

#### Arguments

- None

#### Returns

- `boolean isEnabled` Whether or not culling is enabled.
