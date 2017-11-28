<!--
category: reference
-->

Animator:tell
===

Get the current playback time of an animation.

    time = animator:tell(name)

### Arguments

- `string name` The name of the animation.

### Returns

- `number time` The current time the animation is at.

Notes
---

This will always be between 0 and the duration of the animation.

See also
---

- `Animator:seek`
- `Animator:getDuration`
- `Animator`
