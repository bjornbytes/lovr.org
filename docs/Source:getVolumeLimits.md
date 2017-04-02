<!--
category: reference
-->

Source:getVolumeLimits
===

Get the minimum and maximum volume of the Source.  These limits take precedence over parameters set
by Source:setFalloff and Source:setCone.

    min, max = source:getVolumeLimits()

### Arguments

None

### Returns

- `number min` The minimum volume of the Source.
- `number max` The maximum volume of the Source.

See also
---

- `Source:setVolumeLimits`
