<!--
category: reference
-->

World:isCollisionEnabledBetween
===

Check whether collisions are enabled between two tags.

    enabled = world:isCollisionEnabledBetween(tag1, tag2)

### Arguments

- `string tag1` The first tag.
- `string tag2` The second tag.

### Returns

- `boolean enabled` Whether or not two colliders with the specified tags will collide.

Notes
---

Tags must be set up when creating the World, see `lovr.physics.newWorld`.

See also
---

- `lovr.physics.newWorld`
- `World:disableCollisionBetween`
- `World:enableCollisionBetween`
