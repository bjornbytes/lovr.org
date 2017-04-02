<!--
category: reference
-->

Source:setFalloff
===

Set parameters controlling how the voulme of a Source falls off with distance.

    source:setFalloff(reference, max, rolloff)

### Arguments

- `number reference` The distance at which the volume will start to decrease, in meters.
- `number max` The distance at which the Source will be its quietest, in meters.
- `number rolloff` How quickly the sound falls off between the reference and max distances (1.0 is
  the default).

### Returns

Nothing

See also
---

- `Source:getFalloff`
