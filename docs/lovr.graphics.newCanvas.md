<!--
category: reference
-->

lovr.graphics.newCanvas
===

Creates a new canvas with a given width and height.

    canvas = lovr.graphics.newCanvas(width, height, flags)

### Arguments

- `number width` The width of the canvas, in pixels.
- `number height` The height of the canvas, in pixels.
- `table flags ({})` Optional settings for the canvas.
  - `TextureFormat flags.format ('rgba')` The format to use for the texture.
  - `CanvasType flags.type ('3d')` Whether the Canvas uses a 3d or 2d projection.
  - `number flags.msaa (0)` The number of MSAA samples to use when rendering to the Canvas.
  - `boolean flags.depth (nil)` Whether a depth buffer should be created for the Canvas.  If set to
    `nil`, will be created only if the CanvasType is '3d'.
  - `boolean flags.stencil (false)` Whether a stencil buffer should be created for the Canvas.

### Returns

- `Canvas canvas` The new Canvas.
