<!--
category: reference
-->

lovr.headset.getType
===

Get the type of headset.

    type = lovr.headset.getType()

### Arguments

None

### Returns

- `HeadsetType type` The type of the headset.  Will be "vive" for the HTC Vive and "rift" for the
  Oculus Rift, or "unknown" if it isn't officially supported.
