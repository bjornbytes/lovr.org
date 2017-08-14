<!--
category: reference
-->

lovr.headset.getOriginType
===

Get the coordinate space of the headset.  See `HeadsetOrigin` for more information.

    origin = lovr.headset.getOriginType()

### Arguments

None

### Returns

- `HeadsetOrigin type` The origin of the coordinate space, either `head` or `floor`.

Notes
---

For `head` origins, LÖVR will move the camera up by 1.7 meters to simulate a standing experience,
allowing you to develop for both types of coordinate spaces without changing any code.  This
can be configured in conf.lua, see `lovr.conf`.
