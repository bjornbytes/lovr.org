<!--
category: module
-->

lovr.physics
===

The `lovr.physics` module allows you to simulate 3D rigid body physics.

World
---

A physics `World` holds all of the colliders and joints in the simulation.  It must be updated every
frame using `World:update`, during which it will move all the colliders and resolve collisions
between them.

<table>
<tr>
  <td class="pre">lovr.physics.newWorld</td>
  <td>Create a new <code>World</code>.</td>
</tr>
</table>

Colliders
---

Colliders are objects that represent a single rigid body in the physics simulation.  They can have
forces applied to them and collide with other colliders.

<table>
<tr>
  <td class="pre">World:newCollider</td>
  <td>Add a new <code>Collider</code> to the world.</td>
</tr>

<tr>
  <td class="pre">World:newBoxCollider</td>
  <td>Add a new <code>Collider</code> to the World with a <code>BoxShape</code> attached to it.</td>
</tr>

<tr>
  <td class="pre">World:newCapsuleCollider</td>
  <td>Add a new <code>Collider</code> to the World with a <code>CapsuleShape</code> attached to it.</td>
</tr>

<tr>
  <td class="pre">World:newCylinderCollider</td>
  <td>Add a new <code>Collider</code> to the World with a <code>CylinderShape</code> attached to it.</td>
</tr>

<tr>
  <td class="pre">World:newSphereCollider</td>
  <td>Add a new <code>Collider</code> to the World with a <code>SphereShape</code> attached to it.</td>
</tr>
</table>

Shapes
---

Shapes are 3D physics shapes that can be attached to colliders.  Shapes define, well, the shape of
a Collider and how it collides with other objects.  Without any Shapes, a collider wouldn't collide
with anything.

Normally, you don't need to create Shapes yourself, as there are convenience functions on the World
that will create colliders with shapes already attached.  However, you can attach multiple Shapes to
a collider to create more complicated objects, and sometimes it can be useful to access the individual
Shapes on a collider.

<table>
<tr>
  <td class="pre">lovr.physics.newBoxShape</td>
  <td>Create a new <code>BoxShape</code>.</td>
</tr>

<tr>
  <td class="pre">lovr.physics.newCapsuleShape</td>
  <td>Create a new <code>CapsuleShape</code>.</td>
</tr>

<tr>
  <td class="pre">lovr.physics.newCylinderShape</td>
  <td>Create a new <code>CylinderShape</code>.</td>
</tr>

<tr>
  <td class="pre">lovr.physics.newSphereShape</td>
  <td>Create a new <code>SphereShape</code>.</td>
</tr>
</table>

Joints
---

Joints are objects that constrain the movement of colliders in various ways.  Joints are attached to
two colliders when they're created and usually have a concept of an "anchor", which is where the
Joint is attached to relative to the colliders.  Joints can be used to create all sorts of neat
things like doors, drawers, buttons, levers, or pendulums.

<table>
<tr>
  <td class="pre">lovr.physics.newBallJoint</td>
  <td>Create a new <code>BallJoint</code>.</td>
</tr>

<tr>
  <td class="pre">lovr.physics.newDistanceJoint</td>
  <td>Create a new <code>DistanceJoint</code>.</td>
</tr>

<tr>
  <td class="pre">lovr.physics.newHingeJoint</td>
  <td>Create a new <code>HingeJoint</code>.</td>
</tr>

<tr>
  <td class="pre">lovr.physics.newSliderJoint</td>
  <td>Create a new <code>SliderJoint</code>.</td>
</tr>
</table>
