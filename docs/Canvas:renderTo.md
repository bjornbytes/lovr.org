<!--
category: reference
-->

Canvas:renderTo
===

Render to the Canvas using a function.

    canvas:renderTo(callback)

### Arguments

- `function callback` The function used to render to the canvas.  Normal `lovr.graphics` functions
can be used inside the callback to change the contents of the canvas.

### Returns

Nothing

Notes
---

1. Make sure you clear the contents of the canvas before rendering by using `lovr.graphics.clear`.
Otherwise there might be data in the canvas left over from a previous frame.
