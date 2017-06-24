<!--
category: reference
-->

Collider:isSleepingAllowed
===

Get whether or the collider can be put to sleep.

    allowed = collider:isSleepingAllowed()

### Arguments

None

### Returns

- `boolean allowed` Whether or not sleeping is allowed.

Notes
---

If sleeping is enabled, the world will try to detect if this collider hasn't moved for a while and
put it to sleep.  Sleeping colliders don't impact the physics simulation, which makes updates more
efficient and improves physics performance.  However, the physics engine isn't perfect at waking up
sleeping colliders and this can lead to bugs where colliders don't react to forces or collisions
properly.

It is possible to set the default value for new colliders using `World:setSleepingAllowed`.

Colliders can be manually put to sleep or woken up using `Collider:setAwake`.

See also
---

- `World:isSleepingAllowed`
- `World:setSleepingAllowed`
- `Collider:setSleepingAllowed`
- `Collider:isAwake`
- `Collider:setAwake`
