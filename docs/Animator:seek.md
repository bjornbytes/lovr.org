<!--
category: reference
-->

Animator:seek
===

Seek to a specific time in an animation.

    animator:seek(name, time)

### Arguments

- `string name` The name of the animation to seek.
- `number time` The time to seek to, in seconds.

### Returns

Nothing

Notes
---

If the time is greater than the duration of the animation, the animation will stop if it isn't
currently looping.  Negative time values are supported for animations (regardless of looping state)
and will seek backwards from the animation's end time.

Seeking an animation does not stop or play the animation.

See also
---

- `Animator:tell`
- `Animator:getDuration`
- `Animator`
