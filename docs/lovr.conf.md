<!--
category: callback
-->

lovr.conf
===

The `lovr.conf` callback lets you configure default settings for LÖVR.  It is called once right
before the game starts.  Make sure you put `lovr.conf` in a file called `conf.lua`, a special file
that's loaded before the rest of the framework initializes.  Here's a sample `conf.lua` that sets
all options to their defaults:

    function lovr.conf(t)

      -- The game identity, used as the name of the save directory
      t.identity = 'default'

      -- Enable or disable individual modules.
      t.modules.audio = true
      t.modules.event = true
      t.modules.graphics = true
      t.modules.headset = true
      t.modules.math = true
      t.modules.physics = true
      t.modules.timer = true

      -- Mirror the headset display onto the desktop window
      t.headset.mirror = true

      -- The height of the "default user", in meters.  When there isn't a headset available or the
      -- headset does not support positional tracking, the camera is moved up by this amount to
      -- simulate a standing experience so the camera isn't "in the floor".
      t.headset.offset = 1.7

      -- Window properties
      t.window.width = 800
      t.window.height = 600
      t.window.fullscreen = false
      t.window.msaa = 0
      t.window.title = 'LÖVR'
      t.window.icon = nil
    end

Notes
---

Disabling modules you aren't using, especially the `headset` module or the `physics` module,  can
improve startup time.

You can set `t.window` to `nil` to avoid creating the window.  You can do it yourself later by using
`lovr.graphics.createWindow`.

If the `lovr.graphics` module is disabled or the window isn't created, attempting to use any
functionality requiring graphics may cause a crash.
