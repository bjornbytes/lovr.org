<!--
category: reference
-->

RandomGenerator:setState
===

Set the state for the random generator, as previously obtained using `RandomGenerator:getState`.

    randomGenerator:setState(state)

### Arguments

- `string seed` The state to use.

### Returns

Nothing

Notes
---

The seed represents the starting state of the random generator, whereas the state represents the
current entire state of the generator.

See also
---

- `lovr.math.newRandomGenerator`
- `RandomGenerator:getState`
