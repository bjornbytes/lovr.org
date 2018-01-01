<!--
category: reference
-->

lovr.graphics.getStats
===

Returns graphics-related performance statistics for the current frame.

    stats = lovr.graphics.getStats()

### Arguments

None

### Returns

- `table stats` The graphics stats for the current frame so far.
  - `stats.drawcalls` The number of draw calls.
  - `stats.shaderswitches` The number of shader switches.
