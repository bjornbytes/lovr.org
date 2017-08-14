<!--
category: reference
-->

Controller:isTouched
===

Returns a boolean indicating whether or not a specific button on the Controller is currently touched.

    touched = controller:isTouched(button)

### Arguments

- `ControllerButton button` The button to check.

### Returns

- `boolean touched` Whether or not the button is touched.

Notes
---

Only the `touchpad` button is touch sensitive on the Vive.  All buttons are touch sensitive on the
Oculus Touch.
