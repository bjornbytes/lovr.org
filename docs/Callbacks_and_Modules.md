<!--
category: guide
-->

Callbacks and Modules
===

In the previous example we wrote some code in the `lovr.draw` function to draw text on the screen.
This is an example of a **callback** because we wrote a function and LÖVR "called back" into that
function later.  Defining a callback lets you specify how your project behaves when a specific event
occurs.

In the previous example we also used the `lovr.graphics.print` function to render text to the
screen.  This is an example of using the `lovr.graphics` **module**.  LÖVR has several modules and
each one contains functions related to a certain area of functionality.  For example, there's the
`lovr.graphics` module for rendering graphics, the `lovr.audio` module for playing sounds, and the
`lovr.headset` module for getting information about connected VR hardware.

We can define **callbacks** and call functions from **modules** in them to make things with LÖVR.

Callbacks
---

There are various callbacks that can be used for interesting things.  Three of the most used ones
are `lovr.load`, `lovr.update`, and `lovr.draw`.  A simple project skeleton might look like this:

```
function lovr.load()
  -- This is called once on load.
  --
  -- You can use it to load assets and set everything up.

  print('loaded!')
end

function lovr.update(dt)
  -- This is called continuously and is passed the "delta time" as dt, which
  -- is the number of seconds elapsed since the last update.
  --
  -- You can use it to simulate physics or update game logic.

  print('updating', dt)
end

function lovr.draw(eye)
  -- This is called twice every frame (once for each eye).
  --
  -- You can use it to render the scene.

  print('rendering the ' .. eye .. ' eye')
end
```

By filling in the different callbacks you can start to define the behavior of an app.

To see a list of all the callbacks and read more about their specifics, check out the "Callbacks"
section on the sidebar to the left.

Modules
---

You might be wondering what code to write in the different callbacks.  Inside callbacks you'll Often
call into different modules to get LÖVR to do useful things.

A module is just a Lua table that exposes a set of functions you can call.  Each module is
responsible for a specific area of functionality.  Some modules are relatively low level and, though
useful, they often aren't used in smaller projects.  The most commonly used modules are:

1. `lovr.graphics`
2. `lovr.headset`
3. `lovr.audio`
4. `lovr.physics`
5. `lovr.filesystem`

Each module is described briefly below.

lovr.graphics
---

The graphics module is the most exciting module, and is also the largest.  Most functions in
`lovr.graphics` should be used in `lovr.draw`, since that's where rendering happens.

`lovr.graphics` has a set of handy **graphics primitives** for rendering basic shapes and text.
These can be used to quickly prototype a scene without needing to create or load assets.

There are lots of different rendering-related objects that can be created using `lovr.graphics`,
such as `Model`, `Texture`, `Font`, `Shader`, `Skybox`, and more.  Every function to create a new
object is prefixed with `new`, so to create a 3D model object you can use `lovr.graphics.newModel`.

> Note: Creating graphics objects uses memory and can slow things down if done every frame.  For
> this reason, it's recommended to create objects only once in `lovr.load` before using them!

Another important component of `lovr.graphics` is **graphics state**.  The graphics renderer has a
number of state variables that can be changed, like the color of rendered objects, the font in use,
or the coordinate system.  These functions usually have prefixes of `get` or `set`, so to change the
active color you can use `lovr.graphics.setColor`.  It's important to keep in mind that this state
is **global**, so changing the color will affect all subsequent drawing operations until it's
changed again.

Finally, we'll talk about the coordinate system.  LÖVR uses a 3D coordinate system with values
specified in meters.  Negative z values are in front of the camera, positive y values are above the
ground, and negative x values are to the left.  By default, the coordinate system maps to the VR
play area, so the origin is on the ground in the middle of the play space.

You've already seen `lovr.graphics.print`, but here's another example:

```
function lovr.load()
  -- Load a model with a texture
  model = lovr.graphics.newModel('monkey.obj', 'monkey.png')
end

function lovr.draw()
  -- Use a dark grey background
  lovr.graphics.setBackgroundColor(50, 50, 50)

  -- Draw the model
  lovr.graphics.setColor(255, 255, 255)
  model:draw(-.5, 1, -3)

  -- Draw a red cube using the "cube" primitive
  lovr.graphics.setColor(255, 0, 0)
  lovr.graphics.cube('fill', .5, 1, -3, .5, lovr.timer.getTime())
end
```

lovr.headset
---

lovr.audio
---

lovr.physics
---

lovr.filesystem
---
