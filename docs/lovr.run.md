<!--
category: callback
-->

lovr.run
===

This callback is called to run the game.  The default is usually suitable, but sometimes it is
helpful to override this callback for custom behavior.  For reference, here is the default
`lovr.run`:

    function lovr.run()
      if lovr.load then lovr.load() end

      while true do
        local exit = lovr.step()
        if exit then return exit end
      end
    end
