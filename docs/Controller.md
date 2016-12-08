<!--
category: reference
-->

Controller
---

Controller objects represent the controllers held in players' hands.  To obtain a list of currently
connected controllers, use `lovr.headset.getControllers`.  To determine when controllers are added
and removed, use `lovr.controlleradded` and `lovr.controllerremoved`.  Often Controllers won't
be considered "active" until they are moved around a bit.

### Functions

<table>
<tr>
  <td class="pre">Controller:getAxis</td>
  <td>Get the current state of an axis on the Controller.</td>
</tr>

<tr>
  <td class="pre">Controller:getOrientation</td>
  <td>Get the current angle-axis orientation of the Controller.</td>
</tr>

<tr>
  <td class="pre">Controller:getPosition</td>
  <td>Get the current position of the Controller.</td>
</tr>

<tr>
  <td class="pre">Controller:isDown</td>
  <td>Check whether a button on the Controller is currently pressed.</td>
</tr>

<tr>
  <td class="pre">Controller:isPresent</td>
  <td>Check whether a Controller is connected.</td>
</tr>

<tr>
  <td class="pre">Controller:newModel</td>
  <td>Load a <code>Model</code> instance for the Controller.</td>
</tr>

<tr>
  <td class="pre">Controller:vibrate</td>
  <td>Trigger a haptic pulse on the Controller.</td>
</tr>
</table>

### Types

<table>
<tr>
  <td class="pre">ControllerAxis</td>
  <td>The different axes on a Controller.</td>
</tr>

<tr>
  <td class="pre">ControllerButton</td>
  <td>The different buttons on a Controller.</td>
</tr>
</table>
