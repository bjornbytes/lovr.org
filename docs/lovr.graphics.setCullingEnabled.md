<!--
category: reference
-->

lovr.graphics.setCullingEnabled
---

Enables or disables culling.  Culling is an optimization that avoids rendering the back face of
polygons.  This improves performance by reducing the number of polygons drawn, but requires that the
vertices in triangles are specified in a consistent clockwise or counter clockwise order.  Culling
is initially disabled.

     lovr.graphics.setCullingEnabled(isEnabled)

#### Arguments

- `boolean isEnabled` Whether or not culling should be enabled.

#### Returns

- Nothing
