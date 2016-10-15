lovr.graphics.push
---

Pushes a copy of the current transform onto the transformation stack.  After changing the transform
using `lovr.graphics.translate`, `lovr.graphics.rotate`, and `lovr.graphics.scale`, the original
state can be restored using `lovr.graphics.pop`.  It's important to have a balanced sequence of
pushes and pops in `lovr.draw`.

    lovr.graphics.push()

#### Arguments

- None

#### Returns

- Nothing
