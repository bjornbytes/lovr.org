<!--
category: reference
-->

lovr.timer.step
===

Steps the timer, returning the new delta time.  This is called automatically in `lovr.run`.

    delta = lovr.timer.step()

### Arguments

None

### Returns

- `number delta` The amount of time, in seconds, since the last call to `lovr.timer.step`, or the
  beginning of the game if this function is being called for the first time.
