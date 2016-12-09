<!--
category: reference
-->

PolygonWinding
===

Specifying a winding direction allows LÖVR to determine which side of a triangle is the "front"
side.  This can be combined with culling to improve rendering performance.

### Values

- `clockwise` Triangle vertices are specified in a clockwise order.
- `counterclockwise` Triangle vertices are specified in a counterclockwise order.

Notes
---

The default winding order is `counterclockwise`.
