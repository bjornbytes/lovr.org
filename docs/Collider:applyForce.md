<!--
category: reference
-->

Collider:applyForce
===

Apply a force to the collider.

---

    collider:applyForce(x, y, z)

### Arguments

- `number x` The x component of the force to apply.
- `number y` The y component of the force to apply.
- `number z` The z component of the force to apply.

### Returns

Nothing

---

    collider:applyForce(x, y, z, px, py, pz)

### Arguments

- `number x` The x component of the force to apply.
- `number y` The y component of the force to apply.
- `number z` The z component of the force to apply.
- `number px` The x position to apply the force at, in world coordinates.
- `number py` The y position to apply the force at, in world coordinates.
- `number pz` The z position to apply the force at, in world coordinates.

### Returns

Nothing

See also
---

- `Collider:applyTorque`
