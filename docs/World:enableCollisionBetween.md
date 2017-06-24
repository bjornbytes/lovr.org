<!--
category: reference
-->

World:enableCollisionBetween
===

Enable collision between two collison tags.

    world:enableCollisionBetween(tag1, tag2)

### Arguments

- `string tag1` The first tag.
- `string tag2` The second tag.

### Returns

Nothing

Notes
---

Tags must be set up when creating the World, see `lovr.physics.newWorld`.

See also
---

- `lovr.physics.newWorld`
- `World:disableCollisionBetween`
- `World:isCollisionEnabledBetween`
