<!--
category: callback
-->

lovr.quit
---

This callback is called right before the game is about to quit.  Use it to perform any cleanup you
need to do.  You can also return a "truthy" value from this callback to abort quitting.

    function lovr.quit()
      if shouldQuit() then
        return false
      else
        return true
      end
    end

#### See also

- `lovr.event.quit`
