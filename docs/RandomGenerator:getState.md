<!--
category: reference
-->

RandomGenerator:getState
===

Get the state of the random generator.  This can be used in `RandomGenerator:setState` to restore
a previous state of the generator.

    state = randomGenerator:getState()

### Arguments

None

### Returns

- `string seed` The state of the random generator.

Notes
---

The seed represents the starting state of the random generator, whereas the state represents the
current entire state of the generator.

See also
---

- `lovr.math.newRandomGenerator`
- `RandomGenerator:setState`
