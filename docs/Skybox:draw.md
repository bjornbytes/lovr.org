<!--
category: reference
-->

Skybox:draw
===

Draws a skybox at a specified angle.

    skybox:draw(angle, ax, ay, az)

### Arguments

- `number angle` The number of radians to rotate the skybox around its axis of rotation.
- `number ax` The x component of the vector representing the axis of rotation.
- `number ay` The y component of the vector representing the axis of rotation.
- `number az` The z component of the vector representing the axis of rotation.

### Returns

Nothing

Notes
---

Skyboxes are drawn without depth, meaning anything drawn before the skybox will be covered by the
skybox and the skybox will be behind anything drawn after it.

Because of this, it's usually a good idea to draw a skybox before drawing other geometry.
Additionally, a specialized shader is used to render the skybox.  This means it is not currently
possible to use a custom shader to render skyboxes.

Examples
---

Drawing a Skybox in VR

    function love.load()
      skybox = lovr.graphics.newSkybox({
        '1.png',
        '2.png',
        '3.png',
        '4.png',
        '5.png',
        '6.png'
      })
    end

    function lovr.draw()
      lovr.graphics.setColor(255, 255, 255)
      skybox:draw(lovr.headset.getOrientation())

      -- Draw everything else
    end
