<!--
category: callback
-->

lovr.controllerreleased
===

This callback is called when a button on a `Controller` is released.

    function lovr.controllerreleased(controller, button)
      print('The ' .. button .. ' button was released!')
    end

### Arguments

- `Controller controller` The controller object.
- `ControllerButton button` The button that was released.

See also
---

- `lovr.controllerpressed`
- `lovr.controlleradded`
- `lovr.controllerremoved`
- `Controller`
