lovr.graphics.getScissor
---

Returns the current scissor.  The scissor is a rectangular area of the screen.  Any pixels outside
the scissor region will be unaffected by drawing operations.

    x, y, w, h = lovr.graphics.getScissor()

#### Arguments

- None

#### Returns

- `number x` The x position of the upper left corner of the scissor.
- `number y` The y position of the upper left corner of the scissor.
- `number w` The width of the scissor in pixels.
- `number h` The height of the scissor in pixels.
