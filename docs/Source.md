<!--
category: reference
-->

Source
===

A source is an object representing a sound.  A source can be in three different states:

<table>
<tr>
  <td>Playing</td>
  <td>The source is currently playing.  It can be stopped, paused, or rewound.</td>
</tr>

<tr>
  <td>Paused</td>
  <td>The source is paused.  It can be stopped, played/resumed, or rewound.</td>
</tr>

<tr>
  <td>Stopped</td>
  <td>The source has been stopped.  It can be played.</td>
</tr>
</table>

Functions
---

<table>
<tr>
  <td class="pre">lovr.audio.newSource</td>
  <td>Create a Source.</td>
</tr>

<tr>
  <td class="pre">Source:getBitDepth</td>
  <td>Get the number of bits per channel in the Source.</td>
</tr>

<tr>
  <td class="pre">Source:getChannels</td>
  <td>Get the number of channels in the source (mono/stereo).</td>
</tr>

<tr>
  <td class="pre">Source:getDuration</td>
  <td>Get the duration of the Source.</td>
</tr>

<tr>
  <td class="pre">Source:getOrientation</td>
  <td>Get the orientation vector of the Source.</td>
</tr>

<tr>
  <td class="pre">Source:getPitch</td>
  <td>Get the pitch of the Source.</td>
</tr>

<tr>
  <td class="pre">Source:getPosition</td>
  <td>Get the position of the Source.</td>
</tr>

<tr>
  <td class="pre">Source:getSampleRate</td>
  <td>Get the sample frequency of the Source.</td>
</tr>

<tr>
  <td class="pre">Source:getVolume</td>
  <td>Get the volume of the Source.</td>
</tr>

<tr>
  <td class="pre">Source:isLooping</td>
  <td>Get whether the Source is looping.</td>
</tr>

<tr>
  <td class="pre">Source:isPaused</td>
  <td>Get whether a Source is paused.</td>
</tr>

<tr>
  <td class="pre">Source:isPlaying</td>
  <td>Get whether a Source is playing.</td>
</tr>

<tr>
  <td class="pre">Source:isStopped</td>
  <td>Get whether a Source is stopped.</td>
</tr>

<tr>
  <td class="pre">Source:pause</td>
  <td>Pause a Source.</td>
</tr>

<tr>
  <td class="pre">Source:play</td>
  <td>Play a Source.</td>
</tr>

<tr>
  <td class="pre">Source:resume</td>
  <td>Resume a Source.</td>
</tr>

<tr>
  <td class="pre">Source:rewind</td>
  <td>Rewind a Source, starting it over from the beginning.</td>
</tr>

<tr>
  <td class="pre">Source:seek</td>
  <td>Seek to a specific position in the audio file.</td>
</tr>

<tr>
  <td class="pre">Source:setLooping</td>
  <td>Set whether or not the Source loops.</td>
</tr>

<tr>
  <td class="pre">Source:setOrientation</td>
  <td>Set the direction of a Source.</td>
</tr>

<tr>
  <td class="pre">Source:setPitch</td>
  <td>Set the pitch of a Source.</td>
</tr>

<tr>
  <td class="pre">Source:setPosition</td>
  <td>Set the position of a Source.</td>
</tr>

<tr>
  <td class="pre">Source:setVolume</td>
  <td>Set the volume of a Source.</td>
</tr>

<tr>
  <td class="pre">Source:stop</td>
  <td>Stop a Source.</td>
</tr>

<tr>
  <td class="pre">Source:tell</td>
  <td>Get the current playback position of a Source.</td>
</tr>
</table>
