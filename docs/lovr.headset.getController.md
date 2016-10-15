lovr.headset.getController
---

Returns a controller instance for the specified hand.

    controller = lovr.headset.getController(hand)

#### Arguments

- `ControllerHand hand` The hand to get the controller object for.

#### Returns

- `Controller controller` The controller object.

#### Notes

This function may return `nil` if no controller is connected for the hand.
