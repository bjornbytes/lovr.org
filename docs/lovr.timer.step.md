lovr.timer.step
---

Returns the amount of time since this function was last called.  This is called automatically in the
default `lovr.run` script.

    delta = lovr.timer.step()

#### Arguments

- None

#### Returns

- `number delta` The amount of time, in seconds, since the last call to `lovr.timer.step`, or the
  beginning of the game if this function is being called for the first time.
