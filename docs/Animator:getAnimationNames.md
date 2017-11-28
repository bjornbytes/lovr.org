<!--
category: reference
-->

Animator:getAnimationNames
===

Get a list of all animations this animator can play.

    animations = animator:getAnimationNames()

### Arguments

None

### Returns

- `table names` A list of animation names as strings.

---

Fill a table with the names of animations supported by the animator.  This avoids creating a new
table, which is nice to Lua's garbage collector.

    t = animator:getAnimationNames(t)

### Arguments

- `table t` The table to fill with animation names.

### Returns

- `table t` The input table.

See also
---

- `Animator:getAnimationCount`
- `Animator`
