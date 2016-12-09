<!--
category: module
-->

lovr.timer
===

The `lovr.timer` module provides a few functions that deal with time.  All times are measured in
seconds.

<table>
<tr>
  <td class="pre">lovr.timer.getDelta</td>
  <td>Get the time between the last two frames, known as the <code>dt</code> value.</td>
</tr>

<tr>
  <td class="pre">lovr.timer.getFPS</td>
  <td>Get the current frames per second.</td>
</tr>

<tr>
  <td class="pre">lovr.timer.getTime</td>
  <td>Return the current value of a high resolution timer.</td>
</tr>

<tr>
  <td class="pre">lovr.timer.sleep</td>
  <td>Go to sleep.</td>
</tr>

<tr>
  <td class="pre">lovr.timer.step</td>
  <td>Step the internal clock, updating the value of <code>lovr.timer.getDelta</code>.</td>
</tr>
</table>

