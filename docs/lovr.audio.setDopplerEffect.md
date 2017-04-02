<!--
category: reference
-->

lovr.audio.setDopplerEffect
===

Set parameters controlling the doppler effect.  This is controlled by the speed of sound and the
"scaling" factor, which controls how intense the effect is.

    lovr.audio.getVelocity(factor, speedOfSound)

### Arguments

- `number factor` The scaling factor, controlling how intense the doppler effect is (1.0 by
  default).
- `number speedOfSound` The speed of sound, in meters per second (340.0 is the default).

### Returns

Nothing

See also
---

- `lovr.audio.getDopplerEffect`
