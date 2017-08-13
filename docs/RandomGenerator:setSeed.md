<!--
category: reference
-->

RandomGenerator:setSeed
===

Initialize the random generator with a new seed.

---

    randomGenerator:getSeed(seed)

### Arguments

- `number seed` The new seed to use.  Should only be used for numbers under 2^53.

### Returns

Nothing

---

    randomGenerator:setSeed(low, high)

### Arguments

- `number low` The lower 32 bits of the random seed.
- `number high` The upper 32 bits of the random seed.

### Returns

Nothing

Notes
---

For precise 64 bit seeds, you should specify the lower and upper 32 bits of the seed separately.

See also
---

- `lovr.math.newRandomGenerator`
- `RandomGenerator:getSeed`
