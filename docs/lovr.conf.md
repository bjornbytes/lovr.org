<!--
category: callback
-->

lovr.conf
---

The `lovr.conf` callback lets you configure default settings for LÖVR.  It is called once right
before the game starts.  Make sure you put `lovr.conf` in a file called `conf.lua`, a special file
that's loaded before the rest of the framework initializes.  Here's a sample `conf.lua` that sets
all options to their defaults:

    function lovr.conf(t)
      t.identity = 'default' -- The game identity, used as the name of the save directory
      t.modules.event = true -- Enable the event module
      t.modules.graphics = true -- Enable the graphics module
      t.modules.headset = true -- Enable the headset module
      t.modules.timer = true -- Enable the timer module
    end

Note: Disabling the `headset` module can improve startup time a lot if you aren't intending to use
 `lovr.headset`.
