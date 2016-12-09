<!--
category: reference
-->

lovr.event.pump
===

Fills the event queue with unprocessed events from the operating system.  This function should be
called often, otherwise the operating system will consider your application unresponsive.  By default,
this function is called automatically by `lovr.run`.

    lovr.event.pump()

### Arguments

None

### Returns

Nothing
