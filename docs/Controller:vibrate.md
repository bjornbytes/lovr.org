<!--
category: reference
-->

Controller:vibrate
===

Causes the Controller to vibrate.

    controller:vibrate(duration, power)

### Arguments

- `number duration` The amount of time to vibrate the Controller, in seconds.
- `number power (1)` The strength of the vibration, between 0 and 1.

### Returns

Nothing

Notes
---

On the HTC Vive, the value for `duration` currently must be less than .004 seconds, and the `power`
is always set to 1.0.  Call this function several frames in a row over several frames for stronger
or prolonged vibration patterns.
