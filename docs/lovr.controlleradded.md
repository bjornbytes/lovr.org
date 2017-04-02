<!--
category: callback
-->

lovr.controlleradded
===

This callback is called when a `Controller` is connected, discovered, or woken up.

    function lovr.controlleradded(controller)
      print('There are now ' .. lovr.headset.getControllerCount() .. ' controllers')
    end

See also
---

- `lovr.controllerremoved`
- `lovr.controllerpressed`
- `lovr.controllerreleased`
- `lovr.headset.getControllers`
- `lovr.headset.getControllerCount`
- `Controller`
