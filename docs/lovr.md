<!--
category: module
-->

lovr
===

`lovr` is the single global table that is exposed to every LÖVR app.  It contains a set of
**modules** and a set of **callbacks**.

Modules
---

Modules are the **what** of the application; you can use the functions in modules to tell LÖVR to do
things.  For example, you can draw things on the screen, figure out what buttons on a controller are
pressed, or load a 3D model from a file.  Each module controls a certain aspect of the app, so the
`lovr.graphics` deals with rendering and `lovr.headset` deals with VR.

<table>
<tr>
  <td class="pre">lovr.event</td>
  <td>Deals with events from the hardware and operating system.</td>
</tr>

<tr>
  <td class="pre">lovr.graphics</td>
  <td>Render things to the screen, load images and models from files.</td>
</tr>

<tr>
  <td class="pre">lovr.filesystem</td>
  <td>Read and write files.</td>
</tr>

<tr>
  <td class="pre">lovr.headset</td>
  <td>Access the VR headset and any connected controllers.</td>
</tr>

<tr>
  <td class="pre">lovr.timer</td>
  <td>Get information about time and timers.</td>
</tr>
</table>

Callbacks
---

Callbacks are the **when** of the application; you write code inside callbacks which LÖVR then calls
at certain points in time.  For example, the `lovr.load` callback is called once at the beginning of
the game and can be used to set things up, and the `lovr.controlleradded` callback is called
whenever a new controller is connected.

<table>
<tr>
  <td class="pre">lovr.load</td>
  <td>Called once when the game starts.</td>
</tr>

<tr>
  <td class="pre">lovr.quit</td>
  <td>Called when the game quits.</td>
</tr>

<tr>
  <td class="pre">lovr.update</td>
  <td>Called every frame for updating the game logic.</td>
</tr>

<tr>
  <td class="pre">lovr.draw</td>
  <td>Called when it's time to render a frame.</td>
</tr>

<tr>
  <td class="pre">lovr.controlleradded</td>
  <td>Called whenever a <code>Controller</code> is connected.</td>
</tr>

<tr>
  <td class="pre">lovr.controllerremoved</td>
  <td>Called whenever a <code>Controller</code> is removed.</td>
</tr>

<tr>
  <td class="pre">lovr.conf</td>
  <td>Set configuration settings for LÖVR and control which modules are enabled.</td>
</tr>

<tr>
  <td class="pre">lovr.run</td>
  <td>The main loop for the game.</td>
</tr>
</table>