<!--
category: module
-->

lovr.audio
===

The `lovr.audio` module is responsible for playing sound effects and music.  Currently, the only
supported audio format is .ogg (Vorbis).  Playing a sound involves creating a `Source` object for the
sound and calling `Source:play` on it.

Sources
---

Sources are objects that represent a single sound instance.

<table>
<tr>
  <td class="pre">lovr.audio.newSource</td>
  <td>Create a Source.</td>
</tr>

<tr>
  <td class="pre">lovr.audio.pause</td>
  <td>Pause all Sources.</td>
</tr>

<tr>
  <td class="pre">lovr.audio.resume</td>
  <td>Resume all Sources.</td>
</tr>

<tr>
  <td class="pre">lovr.audio.rewind</td>
  <td>Rewind all Sources.</td>
</tr>

<tr>
  <td class="pre">lovr.audio.stop</td>
  <td>Stop all Sources.</td>
</tr>

<tr>
  <td class="pre">lovr.audio.isSpatialized</td>
  <td>Get whether or not sound is spatialized.</td>
</tr>

<tr>
  <td class="pre">lovr.audio.getVelocity</td>
  <td>Get the velocity of the listener.</td>
</tr>

<tr>
  <td class="pre">lovr.audio.setVelocity</td>
  <td>Set the velocity of the listener.</td>
</tr>

<tr>
  <td class="pre">lovr.audio.update</td>
  <td>An internal function to update audio.</td>
</tr>
</table>

Listener
---

The listener is a virtual object in 3D space that "hears" all the sounds that are playing.  The
listener can be positioned and oriented in 3D space, which controls how Sources in the world are
heard.  For example, sounds further away from the listener will be more quiet, and sounds to the
left of the listener will be heard from the left speaker.  By default, the listener will be
synchronized with any connected headset so audio is positioned properly as the headset is moved
around and rotated.

<table>
<tr>
  <td class="pre">lovr.audio.getPosition</td>
  <td>Get the position of the listener.</td>
</tr>

<tr>
  <td class="pre">lovr.audio.setPosition</td>
  <td>Set the position of the listener.</td>
</tr>

<tr>
  <td class="pre">lovr.audio.getOrientation</td>
  <td>Get the orientation of the listener.</td>
</tr>

<tr>
  <td class="pre">lovr.audio.setOrientation</td>
  <td>Set the orientation of the listener.</td>
</tr>

<tr>
  <td class="pre">lovr.audio.getVolume</td>
  <td>Get the master volume.</td>
</tr>

<tr>
  <td class="pre">lovr.audio.setVolume</td>
  <td>Set the master volume.</td>
</tr>
</table>
