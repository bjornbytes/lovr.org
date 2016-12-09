<!--
category: module
-->

lovr.event
===

The `lovr.event` module controls how and when events are handled.  Note that this is a pretty
low-level module, in fact, most simple projects won't even need to touch this at all!  This is
because the functions here are called automatically by the default `lovr.run` function.  Move along
and go work on stuff that's actually interesting.

<table>
<tr>
  <td class="pre">lovr.event.clear</td>
  <td>Clear the event queue.</td>
</tr>

<tr>
  <td class="pre">lovr.event.poll</td>
  <td>Get an iterator for all unprocessed events in the queue.</td>
</tr>

<tr>
  <td class="pre">lovr.event.pump</td>
  <td>Pump new events into the queue for processing.</td>
</tr>

<tr>
  <td class="pre">lovr.event.push</td>
  <td>Manually push an event onto the queue.</td>
</tr>

<tr>
  <td class="pre">lovr.event.quit</td>
  <td>Quit the game.</td>
</tr>
</table>
