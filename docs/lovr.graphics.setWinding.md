<!--
category: reference
-->

lovr.graphics.setWinding
===

Sets the polygon winding.  This, combined with `lovr.graphics.setCullingEnabled` can improve
performance by avoiding rendering of the backside of triangles.  The default winding is
counterclockwise.

     lovr.graphics.setWinding(winding)

### Arguments

- `Winding winding` The new winding order.

### Returns

Nothing

See Also
---

- `lovr.graphics.getWinding`
