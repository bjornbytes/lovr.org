<!--
category: reference
-->

Collider
===

Colliders are objects that represent a single rigid body in the physics simulation.  They can have
forces applied to them and collide with other colliders.

Creating Colliders
---

<table>
<tr>
  <td class="pre">World:newCollider</td>
  <td>Create a new Collider without any shapes attached.</td>
</tr>

<tr>
  <td class="pre">World:newBoxCollider</td>
  <td>Create a new Collider with a <code>BoxShape</code> attached.</td>
</tr>

<tr>
  <td class="pre">World:newSphereCollider</td>
  <td>Create a new Collider with a <code>SphereShape</code> attached.</td>
</tr>

<tr>
  <td class="pre">World:newCapsuleCollider</td>
  <td>Create a new Collider with a <code>CapsuleShape</code> attached.</td>
</tr>

<tr>
  <td class="pre">World:newCylinderCollider</td>
  <td>Create a new Collider with a <code>CylinderShape</code> attached.</td>
</tr>
</table>

Functions
---

<table>
<tr>
  <td class="pre">Collider:destroy</td>
  <td>Destroy the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:getWorld</td>
  <td>Get the World the Collider is in.</td>
</tr>

<tr>
  <td class="pre">Collider:getTag</td>
  <td>Get the collision tag of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:setTag</td>
  <td>Set the collision tag of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:addShape</td>
  <td>Add a Shape to the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:removeShape</td>
  <td>Remove a Shape from a Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:getShapeList</td>
  <td>Get the list of Shapes attached to the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:getPosition</td>
  <td>Get the position of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:setPosition</td>
  <td>Set the position of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:getOrientation</td>
  <td>Get the orientation of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:setOrientation</td>
  <td>Set the orientation of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:applyForce</td>
  <td>Apply a force to the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:applyTorque</td>
  <td>Apply torque to the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:getLinearVelocity</td>
  <td>Get the linear velocity of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:setLinearVelocity</td>
  <td>Set the linear velocity of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:getAngularVelocity</td>
  <td>Get the angular velocity of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:setAngularVelocity</td>
  <td>Set the angular velocity of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:getLocalCenter</td>
  <td>Get the center of mass of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:getLocalPoint</td>
  <td>Convert a point in world coordinates to coordinates relative to the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:getWorldPoint</td>
  <td>Convert a collider-relative point to world coordinates.</td>
</tr>

<tr>
  <td class="pre">Collider:getLocalVector</td>
  <td>Convert a world direction vector to a vector relative to the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:getWorldVector</td>
  <td>Convert a collider-relative vector to a world vector.</td>
</tr>

<tr>
  <td class="pre">Collider:getLinearVelocityFromLocalPoint</td>
  <td>Get the velocity of a point on the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:getLinearVelocityFromWorldPoint</td>
  <td>Get the velocity of a point on the Collider specified in world coordinates.</td>
</tr>

<tr>
  <td class="pre">Collider:getLinearDamping</td>
  <td>Get the linear damping of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:setLinearDamping</td>
  <td>Set the linear damping of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:getAngularDamping</td>
  <td>Get the angular damping of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:setAngularDamping</td>
  <td>Set the angular damping of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:isKinematic</td>
  <td>Get whether the Collider is kinematic.</td>
</tr>

<tr>
  <td class="pre">Collider:setKinematic</td>
  <td>Set whether the Collider is kinematic.</td>
</tr>

<tr>
  <td class="pre">Collider:isGravityIgnored</td>
  <td>Get whether the Collider ignores gravity.</td>
</tr>

<tr>
  <td class="pre">Collider:setGravityIgnored</td>
  <td>Set whether the Collider ignores gravity.</td>
</tr>

<tr>
  <td class="pre">Collider:isSleepingAllowed</td>
  <td>Get whether the Collider can go to sleep.</td>
</tr>

<tr>
  <td class="pre">Collider:setSleepingAllowed</td>
  <td>Set whether the Collider can go to sleep.</td>
</tr>

<tr>
  <td class="pre">Collider:isAwake</td>
  <td>Get whether the Collider is awake.</td>
</tr>

<tr>
  <td class="pre">Collider:setAwake</td>
  <td>Set whether the Collider is awake.</td>
</tr>

<tr>
  <td class="pre">Collider:getMass</td>
  <td>Get the total mass of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:setMass</td>
  <td>Set the total mass of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:getMassData</td>
  <td>Get the full mass properties of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:setMassData</td>
  <td>Set the full mass properties of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:getAABB</td>
  <td>Get the axis aligned bounding box of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:getFriction</td>
  <td>Get the friction parameter of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:setFriction</td>
  <td>Set the friction parameter of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:getRestitution</td>
  <td>Get the restitution (bounciness) parameter of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:setRestitution</td>
  <td>Set the restitution (bounciness) parameter of the Collider.</td>
</tr>

<tr>
  <td class="pre">Collider:getUserData</td>
  <td>Get the Collider's user data.</td>
</tr>

<tr>
  <td class="pre">Collider:setUserData</td>
  <td>Assign a custom value to the Collider.</td>
</tr>

