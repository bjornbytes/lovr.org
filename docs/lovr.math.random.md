<!--
category: reference
-->

lovr.math.random
===

Generate a uniformly distributed pseudo-random number.

---

    x = lovr.math.random()

### Arguments

None

### Returns

- `number x` A pseudo-random number in the range `[0,1)`.

---

    x = lovr.math.random(a)

### Arguments

- `number a` The maximum number to generate.

### Returns

- `number x` A pseudo-random integer in the range `[1,a]`.

---

    x = lovr.math.random(a, b)

### Arguments

- `number a` The minimum number to generate.
- `number b` The maximum number to generate.

### Returns

- `number x` A pseudo-random integer in the range `[a,b]`.

See also
---

- `lovr.math.randomNormal`
