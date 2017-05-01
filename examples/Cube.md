<!--
author: bjornbytes
code: |
  function lovr.draw()
    lovr.graphics.cube('line', 0, 0, -1, .5, lovr.timer.getTime(), 0, 1, 0)
  end
-->

Cube
===

LÖVR provides a graphics primitive for drawing a cube, `lovr.graphics.cube`.  Here, we use it
to draw a cube at (0, 0, -1) which is in front of the camera.  We use .5 meters for the size and use
`lovr.timer.getTime` for the angle of rotation so the cube appears to animate its rotation over time.
