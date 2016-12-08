<!--
category: reference
-->

lovr.headset.getType
---

Get the type of headset.  Currently only the HTC Vive is supported, though support for the Oculus
Rift and other devices is planned.

    type = lovr.headset.getType()

#### Arguments

- None

#### Returns

- `string type` The type of the headset.  Will be "Vive" for the HTC Vive and "Rift" for the Oculus
  Rift.
