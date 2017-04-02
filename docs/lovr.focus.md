<!--
category: callback
-->

lovr.focus
===

The `lovr.focus` callback is called whenever the application acquires or loses focus (for example,
when opening or closing the Steam dashboard).  The callback receives a single argument, `focused`,
which is a boolean indicating whether or not the application is now focused.  It may make sense
to pause the game or reduce visual fidelity when the application loses focus.

    function lovr.focus(focused)
      paused = not focused
    end
