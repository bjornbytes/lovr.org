<!--
category: reference
-->

Animator
===

An animator is an object that controls the playback of skeletal animations.  An animator is created
with `lovr.graphics.newAnimator`, and can be attached to models using `Model:setAnimator`.  Once
attached, the `Model` will render using the animator's pose instead of the default pose.  Don't
forget to update the animator in `lovr.update` using `Animator:update`!

Functions
---

<table>
<tr>
  <td class="pre">lovr.graphics.newAnimator</td>
  <td>Create an Animator.</td>
</tr>

<tr>
  <td class="pre">Animator:getAnimationCount</td>
  <td>Get the number of animations the Animator can play.</td>
</tr>

<tr>
  <td class="pre">Animator:getAnimationNames</td>
  <td>Get a list of all animations the Animator can play.</td>
</tr>

<tr>
  <td class="pre">Animator:update</td>
  <td>Advance the Animator's clock to progress through animations.</td>
</tr>

<tr>
  <td class="pre">Animator:play</td>
  <td>Start playing an animation.</td>
</tr>

<tr>
  <td class="pre">Animator:stop</td>
  <td>Stop an animation.</td>
</tr>

<tr>
  <td class="pre">Animator:pause</td>
  <td>Pause an animation.</td>
</tr>

<tr>
  <td class="pre">Animator:resume</td>
  <td>Resume an animation.</td>
</tr>

<tr>
  <td class="pre">Animator:reset</td>
  <td>Stop all animations.</td>
</tr>

<tr>
  <td class="pre">Animator:seek</td>
  <td>Seek to a specific time in an animation.</td>
</tr>

<tr>
  <td class="pre">Animator:tell</td>
  <td>Get the current time of an animation.</td>
</tr>

<tr>
  <td class="pre">Animator:getSpeed</td>
  <td>Get the speed of an animation.</td>
</tr>

<tr>
  <td class="pre">Animator:setSpeed</td>
  <td>Set the speed of an animation.</td>
</tr>

<tr>
  <td class="pre">Animator:isLooping</td>
  <td>Get whether an animation is currently looping.</td>
</tr>

<tr>
  <td class="pre">Animator:setLooping</td>
  <td>Set whether an animation should loop.</td>
</tr>

<tr>
  <td class="pre">Animator:getDuration</td>
  <td>Get the duration of an animation.</td>
</tr>

<tr>
  <td class="pre">Animator:isPlaying</td>
  <td>Figure out if an animation is currently playing.</td>
</tr>

<tr>
  <td class="pre">Animator:getAlpha</td>
  <td>Get the alpha (weight) of an animation.</td>
</tr>

<tr>
  <td class="pre">Animator:setAlpha</td>
  <td>Set the alpha (weight) of an animation.</td>
</tr>

<tr>
  <td class="pre">Animator:getPriority</td>
  <td>Get the priority of an animation, used for mixing.</td>
</tr>

<tr>
  <td class="pre">Animator:setPriority</td>
  <td>Set the priority of an animation, used for mixing.</td>
</tr>
</table>
