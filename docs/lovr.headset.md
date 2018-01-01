<!--
category: module
-->

lovr.headset
===

The `lovr.headset` module is where all the magical VR functionality is.  With it, you can access
connected VR hardware and get information about the available space the player has.  Note that all
units are reported in meters.  Position `(0, 0, 0)` is the center of the play area.

Headset
---

Functions that return information about the head mounted display (HMD) currently strapped to the
player's face.

<table>
<tr>
  <td class="pre">lovr.headset.isPresent</td>
  <td>Get whether or not a headset is connected.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.getType</td>
  <td>Get the type of the connected headset.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.getOriginType</td>
  <td>Get the coordinate space used by the headset.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.getPosition</td>
  <td>Get the current position of the headset in 3D space.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.getOrientation</td>
  <td>Get the current orientation of the headset in 3D space.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.getPose</td>
  <td>Get the position and orientation of the headset.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.getVelocity</td>
  <td>Get the current velocity of the headset.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.getAngularVelocity</td>
  <td>Get the current angular velocity of the headset.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.getClipDistance</td>
  <td>Get the near and far clipping planes of the headset display.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.setClipDistance</td>
  <td>Set the near and far clipping planes of the headset display.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.getDisplayWidth</td>
  <td>Get the width of the headset display.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.getDisplayHeight</td>
  <td>Get the height of the headset display.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.getDisplayDimensions</td>
  <td>Get the dimensions of the headset display.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.renderTo</td>
  <td>Render to the headset using a function.</td>
</tr>
</table>

Play area
---

Retrieve information about the size and shape of the room the player is in, and provides information
about the "chaperone", a visual indicator that appears whenever a player is about to run into a
wall.

<table>
<tr>
  <td class="pre">lovr.headset.getBoundsWidth</td>
  <td>Get the width of the play area.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.getBoundsDepth</td>
  <td>Get the depth of the play area.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.getBoundsDimensions</td>
  <td>Get the size of the play area.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.getBoundsGeometry</td>
  <td>Get a list of points representing the corners of the play area.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.isBoundsVisible</td>
  <td>Get whether the chaperone is currently visible.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.setBoundsVisible</td>
  <td>Request that the chaperone be shown or hidden.</td>
</tr>
</table>

Controllers
---

Get a list of connected `Controller`s.  Also see `lovr.controlleradded` and `lovr.controllerremoved`.

<table>
<tr>
  <td class="pre">lovr.headset.getControllers</td>
  <td>Retrieve a list of currently connected <code>Controller</code> objects.</td>
</tr>

<tr>
  <td class="pre">lovr.headset.getControllerCount</td>
  <td>Get the number of currently connected <code>Controller</code> objects.</td>
</tr>
</table>
