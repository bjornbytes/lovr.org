<!--
category: reference
-->

Collider:setAwake
===

Put the collider to sleep or wake it up.

    collider:setAwake(awake)

### Arguments

- `boolean awake` Whether or not the collider should be awake.

### Returns

Nothing

Notes
---

Sleeping colliders don't impact the physics simulation, which makes updates more efficient and
improves physics performance.

See also
---

- `World:isSleepingAllowed`
- `World:setSleepingAllowed`
- `Collider:isSleepingAllowed`
- `Collider:setSleepingAllowed`
- `Collider:isAwake`
