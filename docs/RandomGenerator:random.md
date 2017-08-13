<!--
category: reference
-->

RandomGenerator:random
===

Generate a uniformly distributed pseudo-random number.

---

    x = randomGenerator:random()

### Arguments

None

### Returns

- `number x` A pseudo-random number in the range `[0,1)`.

---

    x = randomGenerator:random(a)

### Arguments

- `number a` The maximum number to generate.

### Returns

- `number x` A pseudo-random integer in the range `[1,a]`.

---

    x = randomGenerator:random(a, b)

### Arguments

- `number a` The minimum number to generate.
- `number b` The maximum number to generate.

### Returns

- `number x` A pseudo-random integer in the range `[a,b]`.

See also
---

- `lovr.math.random`
- `RandomGenerator:randomNormal`
