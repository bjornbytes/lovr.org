<!--
category: reference
-->

Collider:isAwake
===

Get whether or not the collider is currently awake.

    awake = collider:isAwake()

### Arguments

None

### Returns

- `boolean awake` Whether or not the collider is awake.

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
- `Collider:setAwake`
