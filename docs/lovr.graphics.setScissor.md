lovr.graphics.setScissor
---

Sets the scissor region.  The scissor is a rectangular area of the screen.  Any pixels outside
the scissor region will be unaffected by drawing operations.

    lovr.graphics.setScissor(x, y, w, h)

#### Arguments

- `number x` The x position of the upper left corner of the scissor.
- `number y` The y position of the upper left corner of the scissor.
- `number w` The width of the scissor in pixels.
- `number h` The height of the scissor in pixels.

#### Returns

- Nothing
