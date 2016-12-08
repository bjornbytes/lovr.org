<!--
category: reference
-->

Controller:vibrate
---

Causes the Controller to vibrate.

    controller:vibrate(duration)

#### Arguments

- `number duration` The amount of time to vibrate the Controller, in seconds.

#### Returns

- Nothing

#### Notes

On the HTC Vive, the value for `duration` currently must be less than .004 seconds.  Call this
function several frames in a row for stronger or prolonged vibration patterns.
