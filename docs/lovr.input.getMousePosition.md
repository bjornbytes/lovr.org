<!--
category: reference
-->

lovr.input.getMousePosition
===

Returns current position of the mouse in screen (pixel) coordinates.
The position is relative to the top-left of the window (0,0).
The position is not clipped to the window size - it may return negative numbers
or numbers greater than the width/height of the window.

    x, y = lovr.input.getMousePosition()

### Arguments

None

### Returns

- `number x` The screen x position of the mouse
- `number y` The screen y position of the mouse

