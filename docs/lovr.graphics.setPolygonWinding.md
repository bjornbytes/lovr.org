<!--
category: reference
-->

lovr.graphics.setPolygonWinding
===

Sets the polygon winding.  This, combined with `lovr.graphics.setCullingEnabled` can improve
performance by avoiding rendering of the backside of triangles.  The default winding is
counterclockwise.

     lovr.graphics.setPolygonWinding(winding)

### Arguments

- `PolygonWinding winding` The new winding order.

### Returns

Nothing
