<!--
category: callback
-->

lovr.errhand
===

The `lovr.errhand` callback is triggered whenever an error occurs during runtime.  It receives a
single string parameter, `message`, containing the string of the error message.

    function lovr.errhand(message)
      print('oh NNNOO: ' .. message)
    end
