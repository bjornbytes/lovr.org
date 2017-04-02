<!--
category: reference
-->

Source:getFalloff
===

Get parameters controlling how the voulme of a Source falls off with distance.

    reference, max, rolloff = source:getFalloff()

### Arguments

None

### Returns

- `number reference` The distance at which the volume will start to decrease.
- `number max` The distance at which the Source will be its quietest.
- `number rolloff` How quickly the sound falls off between the reference and max distances (1.0 is
  the default).

See also
---

- `Source:setFalloff`
