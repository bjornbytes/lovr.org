<!--
category: reference
-->

World
===

A World is an object that holds all of the colliders, joints, and shapes in a physics simulation.

Basics
---

<table>
<tr>
  <td class="pre">lovr.physics.newWorld</td>
  <td>Create a World.</td>
</tr>

<tr>
  <td class="pre">World:update</td>
  <td>Update the World.</td>
</tr>

<tr>
  <td class="pre">World:destroy</td>
  <td>Destroy the World!!  Muahaha!</td>
</tr>

<tr>
  <td class="pre">World:raycast</td>
  <td>Cast a ray and calls a function for all colliders it hits.</td>
</tr>
</table>

Colliders
---

The following functions add Colliders to the World.  `World:newCollider` adds an "empty" Collider
without any Shapes attached, whereas the other functions are shortcut functions to add Colliders
with Shapes already attached to them.

<table>
<tr>
  <td class="pre">World:newCollider</td>
  <td>Add a new <code>Collider</code> to the World.</td>
</tr>

<tr>
  <td class="pre">World:newBoxCollider</td>
  <td>Add a new <code>Collider</code> to the World with a <code>BoxShape</code> attached.</td>
</tr>

<tr>
  <td class="pre">World:newSphereCollider</td>
  <td>Add a new <code>Collider</code> to the World with a <code>SphereShape</code> attached.</td>
</tr>

<tr>
  <td class="pre">World:newCapsuleCollider</td>
  <td>Add a new <code>Collider</code> to the World with a <code>CapsuleShape</code> attached.</td>
</tr>

<tr>
  <td class="pre">World:newCylinderCollider</td>
  <td>Add a new <code>Collider</code> to the World with a <code>CylinderShape</code> attached.</td>
</tr>
</table>

Properties
---

The following functions are global properties of the simulation that apply to all Colliders.

<table>
<tr>
  <td class="pre">World:getGravity</td>
  <td>Get the gravity of the World.</td>
</tr>

<tr>
  <td class="pre">World:setGravity</td>
  <td>Set the gravity of the World.</td>
</tr>

<tr>
  <td class="pre">World:getLinearDamping</td>
  <td>Get the linear damping of the World.</td>
</tr>

<tr>
  <td class="pre">World:setLinearDamping</td>
  <td>Set the linear damping of the World.</td>
</tr>

<tr>
  <td class="pre">World:getAngularDamping</td>
  <td>Get the angular damping of the World.</td>
</tr>

<tr>
  <td class="pre">World:setAngularDamping</td>
  <td>Set the angular damping of the World.</td>
</tr>

<tr>
  <td class="pre">World:isSleepingAllowed</td>
  <td>Get whether colliders can go to sleep.</td>
</tr>

<tr>
  <td class="pre">World:setSleepingAllowed</td>
  <td>Set whether colliders can go to sleep.</td>
</tr>
</table>

Collision
---

### Tags

When the World is created using `lovr.physics.newWorld`, it is possible to specify a list of
collision tags for the World.  Colliders can then be assigned a tag.  The following functions enable
or disable collision between tags.

<table>
<tr>
  <td class="pre">World:disableCollisionBetween</td>
  <td>Disable collision between two tags.</td>
</tr>

<tr>
  <td class="pre">World:enableCollisionBetween</td>
  <td>Enable collision between two tags.</td>
</tr>

<tr>
  <td class="pre">World:isCollisionEnabledBetween</td>
  <td>Get whether colliders with two tags will collide.</td>
</tr>
</table>

### Collision Resolution

The following functions are usually called in the callback passed to `World:update` for custom
collision resolution.  They give you fine grained control over how collisions are detected and
processed.

<table>
<tr>
  <td class="pre">World:computeOverlaps</td>
  <td>Compute pairs of shapes that are close to each other.</td>
</tr>

<tr>
  <td class="pre">World:overlaps</td>
  <td>Iterate over pairs of nearby shapes.</td>
</tr>

<tr>
  <td class="pre">World:collide</td>
  <td>Attempt to collide two shapes.</td>
</tr>
</table>
