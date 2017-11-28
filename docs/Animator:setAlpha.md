<!--
category: reference
-->

Animator:setAlpha
===

Set the alpha of an animation.

    animator:setAlpha(animation, alpha)

### Arguments

- `string animation` The name of an animation.
- `number alpha` The new alpha for the animation.

### Returns

Nothing

Notes
---

The alpha is a number between 0 and 1 indicating how the animation's pose is blended with other
animations.  An alpha of 1 means the animation's pose will completely overwrite the existing pose,
whereas an alpha of .5 would blend half of the animation's pose with half of the existing pose.
This, combined with the animation's priority, allows for fine grained control over how multiple playing
animations get blended together.

See also
---

- `Animator:getAlpha`
- `Animator:getPriority`
- `Animator:setPriority`
- `Animator`
