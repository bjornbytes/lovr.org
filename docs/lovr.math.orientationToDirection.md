<!--
category: reference
-->

lovr.math.orientationToDirection
===

Converts rotation in angle/axis representation into a direction vector.

    x, y, z = lovr.math.orientationToDirection(angle, ax, ay, az)

### Arguments

- `number angle` The angle (in radians).
- `number ax (0)` The x component of the axis of rotation.
- `number ay (1)` The y component of the axis of rotation.
- `number az (0)` The z component of the axis of rotation.

### Returns

- `number x` The x component of the direction vector.
- `number y` The y component of the direction vector.
- `number z` The z component of the direction vector.

Example
---

Give Controllers laser beams:

    function lovr.draw()
      for i, controller in ipairs(lovr.headset.getControllers()) do
        local x, y, z = controller:getPosition()
        local angle, ax, ay, az = controller:getOrientation()
        local dx, dy, dz = lovr.math.orientationToDirection(angle, ax, ay, az)
        local length = 2
        lovr.graphics.line(x, y, z, x + dx * length, y + dy * length, z + dz * length)
      end
    end

See also
---

- `lovr.math.lookAt`
