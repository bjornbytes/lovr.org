<!--
category: callback
-->

lovr.update
===

The `lovr.update` callback should be used to update your game's logic.  It receives a single
parameter, `dt`, which represents the amount of elapsed time between frames.  You can use this value
to scale timers, physics, and animations in your game so they play at a smooth, consistent speed.

    function lovr.update(dt)
      player.vy = player.vy + player.gravity * dt
      player.y = player.y + player.vy * dt
    end
