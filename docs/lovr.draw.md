<!--
category: callback
-->

lovr.draw
===

This callback is called every frame.  Use it to render the scene.  If a VR headset is connected,
this function will be called twice per frame (once for each eye) and the function will instead draw
to the headset's display.

    function lovr.draw(eye)
      -- Put your lovr.graphics functions here!
    end

See also
---

- `lovr.headset.renderTo`
- `HeadsetEye`
