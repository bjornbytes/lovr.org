<!--
category: reference
-->

RandomGenerator
===

A RandomGenerator is a standalone object that can be used to independently generate pseudo-random
numbers.  If you just need basic randomness, you can use `lovr.math.random` without needing to
create a random generator.

<table>
<tr>
  <td class="pre">lovr.math.newRandomGenerator</td>
  <td>Create a new RandomGenerator.</td>
</tr>

<tr>
  <td class="pre">RandomGenerator:random</td>
  <td>Get the next number from the pseudo-random sequence.</td>
</tr>

<tr>
  <td class="pre">RandomGenerator:randomNormal</td>
  <td>Get a random number from a normal distribution.</td>
</tr>

<tr>
  <td class="pre">RandomGenerator:getSeed</td>
  <td>Get the seed used to initialize the generator's sequence.</td>
</tr>

<tr>
  <td class="pre">RandomGenerator:setSeed</td>
  <td>Initialize the generator with a new seed value.</td>
</tr>

<tr>
  <td class="pre">RandomGenerator:getState</td>
  <td>Get an implementation-dependent string representing the current generator state.</td>
</tr>

<tr>
  <td class="pre">RandomGenerator:setState</td>
  <td>Restore the generator's state from a previous call to getState.</td>
</tr>
</table>
