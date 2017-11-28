<!--
category: callback
-->

lovr.step
===

This callback is called by `lovr.run` to run a single iteration of the game loop.  The default is
usually suitable, but sometimes it is helpful to override this callback for custom behavior.  For
reference, here is the default `lovr.step`:

    function lovr.step()
      lovr.event.pump()

      for name, a, b, c, d in lovr.event.poll() do
        if name == 'quit' and (not lovr.quit or not lovr.quit()) then
          return a
        end

        lovr.handlers[name](a, b, c, d)
      end

      local dt = lovr.timer.step()
      if lovr.headset then
        lovr.headset.update(dt)
      end

      if lovr.audio then
        lovr.audio.update()
        if lovr.headset and lovr.headset.isPresent() then
          lovr.audio.setOrientation(lovr.headset.getOrientation())
          lovr.audio.setPosition(lovr.headset.getPosition())
          lovr.audio.setVelocity(lovr.headset.getVelocity())
        end
      end

      if lovr.update then lovr.update(dt) end

      if lovr.graphics then
        lovr.graphics.clear()
        lovr.graphics.origin()

        if lovr.draw then
          if lovr.headset and lovr.headset.isPresent() then
            lovr.headset.renderTo(headsetRenderCallback)
          else
            lovr.graphics.translate('view', 0, -conf.headset.offset, 0)
            lovr.draw()
          end
        end

        lovr.graphics.present()
      end

      lovr.timer.sleep(.001)
    end
