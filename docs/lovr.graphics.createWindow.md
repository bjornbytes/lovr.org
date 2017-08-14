<!--
category: reference
-->

lovr.graphics.createWindow
===

Create the desktop window, usually used to mirror the headset display.

    lovr.graphics.createWindow(width, height, fullscreen, msaa, title, icon)

### Arguments

- `number width (800)` The width of the window.
- `number height (600)` The height of the window.
- `boolean fullscreen (false)` Whether or not the window should be fullscreen.
- `number msaa (0)` How many samples to use for multisample antialiasing.
- `string title` The title of the window.
- `string icon` The path to an icon to use for the window.

### Returns

Nothing

Notes
---

This function can only be called once.  It is normally called internally, but you can override this
by setting `window` to `nil` in `conf.lua`.  See `lovr.conf` for more information.
