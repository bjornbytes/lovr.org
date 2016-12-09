<!--
category: reference
-->

lovr.timer.getDelta
===

Returns the time between the last two frames.

    dt = lovr.timer.getDelta()

### Arguments

None

### Returns

- `number dt` The time passed, in seconds.

Notes
---

The return value of this function will remain the same until `lovr.timer.step` is called.  This
function should not be used to measure times for game behavior or benchmarking, use
`lovr.timer.getTime` for that.  This value is the `dt` passed into `lovr.update`.
