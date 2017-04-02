<!--
category: reference
-->

Source:setCone
===

Set the directional volume cone of the Source.

    source:setCone(innerAngle, outerAngle, outerVolume)

### Arguments

- `number innerAngle` A number of radians defining an "inner cone".  If the listener is inside the
  inner cone, the volume of the Source will remain unchanged.
- `number outerAngle` A number of radians defining an "outer cone".  If the listener is between the
  inner and outer cones, the volume will fall off.
- `number outerVolume` The volume of the Source when the listener is outside both the inner and
  outer cones.

### Returns

Nothing

See also
---

- `SourcegsetCone`
