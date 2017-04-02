<!--
category: callback
-->

lovr.controllerpressed
===

This callback is called when a button on a `Controller` is pressed.

    function lovr.controllerpressed(controller, button)
      print('The ' .. button .. ' button was pressed!')
    end

### Arguments

- `Controller controller` The controller object.
- `ControllerButton button` The button that was pressed.

See also
---

- `lovr.controllerreleased`
- `lovr.controlleradded`
- `lovr.controllerremoved`
- `Controller`
