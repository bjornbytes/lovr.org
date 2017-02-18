<!--
category: reference
-->

Transform:origin
===

Reset the Transform to the origin.

    transform:origin()

### Arguments

None

### Returns

Nothing

Example
---

    transform = lovr.math.newTransform(3, 4, 5)
    print(transform:transformPoint(1, 2, 2)) -- Prints 4, 6, 7
    transform:origin()
    print(transform:transformPoint(1, 2, 3)) -- Prints 1, 2, 3

See also
---

- `Transform:transformPoint`
