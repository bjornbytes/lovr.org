<!--
category: callback
-->

lovr.controllerremoved
===

This callback is called when a `Controller` is disconnected, turned off, or otherwise disrupted.

    function lovr.controllerremoved(controller)
      print('We just lost a controller!')
    end

See also
---

- `lovr.controlleradded`
- `lovr.controllerpressed`
- `lovr.controllerreleased`
- `lovr.headset.getControllers`
- `lovr.headset.getControllerCount`
- `Controller`
