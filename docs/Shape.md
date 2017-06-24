<!--
category: reference
-->

Shape
===

A Shape is a physics object that can be attached to colliders to define their shape.

<table>
<tr>
  <td class="pre">lovr.physics.newBoxShape</td>
  <td class="pre">World:newBoxCollider</td>
  <td>Create a new <code>BoxShape</code>.</td>
</tr>

<tr>
  <td class="pre">lovr.physics.newCapsuleShape</td>
  <td class="pre">World:newCapsuleCollider</td>
  <td>Create a new <code>CapsuleShape</code>.</td>
</tr>

<tr>
  <td class="pre">lovr.physics.newCylinderShape</td>
  <td class="pre">World:newCylinderCollider</td>
  <td>Create a new <code>CylinderShape</code>.</td>
</tr>

<tr>
  <td class="pre">lovr.physics.newSphereShape</td>
  <td class="pre">World:newSphereCollider</td>
  <td>Create a new <code>SphereShape</code>.</td>
</tr>
</table>

Functions
---

<table>
<tr>
  <td class="pre">Shape:destroy</td>
  <td>Destroy the shape.</td>
</tr>

<tr>
  <td class="pre">Shape:getType</td>
  <td>Get the type of shape.</td>
</tr>

<tr>
  <td class="pre">Shape:getCollider</td>
  <td>Get the collider the Shape is attached to (if any).</td>
</tr>

<tr>
  <td class="pre">Shape:isEnabled</td>
  <td>Get whether the Shape is enabled.</td>
</tr>

<tr>
  <td class="pre">Shape:setEnabled</td>
  <td>Enable or disable the Shape.</td>
</tr>

<tr>
  <td class="pre">Shape:getUserData</td>
  <td>Get the user data associated with the Shape.</td>
</tr>

<tr>
  <td class="pre">Shape:setUserData</td>
  <td>Associate a value with a Shape.</td>
</tr>

<tr>
  <td class="pre">Shape:getPosition</td>
  <td>Get the positional offset of the Shape.</td>
</tr>

<tr>
  <td class="pre">Shape:setPosition</td>
  <td>Set the positional offset of the Shape.</td>
</tr>

<tr>
  <td class="pre">Shape:getOrientation</td>
  <td>Get the rotational offset of the Shape.</td>
</tr>

<tr>
  <td class="pre">Shape:setOrientation</td>
  <td>Set the rotational offset of the Shape.</td>
</tr>

<tr>
  <td class="pre">Shape:getMass</td>
  <td>Compute mass properties of a Shape.</td>
</tr>

<tr>
  <td class="pre">Shape:getAABB</td>
  <td>Get the bounding box of the Shape.</td>
</tr>
</table>
