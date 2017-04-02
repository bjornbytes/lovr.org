<!--
category: reference
-->

lovr.audio.setVelocity
===

Set the velocity of the listener, controlling the doppler effect.

    lovr.audio.setVelocity(x, y, z)

### Arguments

- `number x` The x velocity of the listener, in meters per second.
- `number y` The y velocity of the listener, in meters per second.
- `number z` The z velocity of the listener, in meters per second.

### Returns

Nothing

Example
---

Note: The default `lovr.run` will do this for you automatically.

```
function lovr.update()
  lovr.audio.setVelocity(lovr.headset.getVelocity())
end
```

See also
---

- `lovr.audio.getVelocity`
