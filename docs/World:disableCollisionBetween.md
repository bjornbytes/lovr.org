<!--
category: reference
-->

World:disableCollisionBetween
===

Disable collision between two collison tags.

    world:disableCollisionBetween(tag1, tag2)

### Arguments

- `string tag1` The first tag.
- `string tag2` The second tag.

### Returns

Nothing

Notes
---

Tags must be set up when creating the World, see `lovr.physics.newWorld`.

By default, collisions are enabled between all tags.

See also
---

- `lovr.physics.newWorld`
- `World:enableCollisionBetween`
- `World:isCollisionEnabledBetween`
