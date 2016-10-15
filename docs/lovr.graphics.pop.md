lovr.graphics.pop
---

Pops the current transform from the stack, returning to the transformation that was applied before
`lovr.graphics.push` was called.  It's important to have a balanced sequence of pushes and pops in
`lovr.graphics.draw`.

    lovr.graphics.pop()

#### Arguments

- None

#### Returns

- Nothing
