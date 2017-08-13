<!--
category: reference
-->

RandomGenerator:getSeed
===

Returns the seed used to initialize the random generator.

    low, high = randomGenerator:getSeed()

### Arguments

None

### Returns

- `number low` The lower 32 bits of the random seed.
- `number high` The upper 32 bits of the random seed.

Notes
---

Since the seed is a 64 bit integer, each 32 bits of the seed are returned separately to avoid
precision issues.

See also
---

- `lovr.math.newRandomGenerator`
- `RandomGenerator:setSeed`
