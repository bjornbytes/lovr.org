<!--
category: reference
-->

lovr.math.newRandomGenerator
===

Creates a new `RandomGenerator`, which can be used to generate random numbers.  If you just want
some random numbers, you can use `lovr.math.random`.  Individual `RandomGenerator` objects are
useful if you need more control over the random sequence used or need a random generator isolated
from other instances.

---

    randomGenerator = lovr.math.newRandomGenerator()

### Arguments

None

### Returns

- `RandomGenerator randomGenerator` The new random generator with a default seed.

---

    randomGenerator = lovr.math.newRandomGenerator(seed)

### Arguments

- `number seed` The initial seed for the random generator.

### Returns

- `RandomGenerator randomGenerator` The new random generator.

---

This variant allows creation of random generators with precise 64-bit seed values, since Lua's
number format loses precision with really big numbers.

    randomGenerator = lovr.math.newRandomGenerator(low, high)

### Arguments

- `number low` The lower 32 bits of the seed.
- `number high` The upper 32 bits of the seed.

### Returns

- `RandomGenerator randomGenerator` The new random generator.

See also
---

- `lovr.math.random`
