lovr.headset.renderTo
---

Renders to each eye of the headset using a function.

This function takes care of setting the appropriate graphics transformations to ensure that the
scene is rendered as though it is being viewed through each eye of the player.  It also takes care
of setting the correct projection for the headset lenses.

If the headset module is enabled, this function is called automatically by `lovr.run` with
`lovr.draw` as the callback.

    lovr.headset.renderTo(callback)

#### Arguments

- `function callback` The function used to render.  It will be passed a string representing the
  current eye that is being rendered to: "left" or "right".

#### Returns

- Nothing
