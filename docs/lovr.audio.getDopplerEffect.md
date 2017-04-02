<!--
category: reference
-->

lovr.audio.getDopplerEffect
===

Get parameters controlling the doppler effect.  This is controlled by the speed of sound and the
"scaling" factor, which controls how intense the effect is.

    factor, speedOfSound = lovr.audio.getVelocity()

### Arguments

None

### Returns

- `number factor` The scaling factor, controlling how intense the doppler effect is (1.0 by
  default).
- `number speedOfSound` The speed of sound, in meters per second (340.0 is the default).

See also
---

- `lovr.audio.setDopplerEffect`
