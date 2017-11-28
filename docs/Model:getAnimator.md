<!--
category: reference
-->

Model:getAnimator
===

Get the `Animator` attached to a model.  When attached, the animator will alter the pose of the
bones of the model based on the set of playing animations.

    animator = model:getAnimator()

### Arguments

None

### Returns

- `Animator animator` The current Animator attached to the Model, or `nil` if none is attached.

See also
---

- `Model:setAnimator`
- `Animator`
- `lovr.graphics.newAnimator`
