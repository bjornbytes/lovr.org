<!--
category: reference
-->

Collider:setMassData
===

Set the mass properties of the collider.

    collider:setMassData(cx, cy, cz, mass, inertia)

### Arguments

- `number cx` The x position of the center of mass of the collider.
- `number cy` The y position of the center of mass of the collider.
- `number cz` The z position of the center of mass of the collider.
- `number mass` The total mass of the collider.
- `table inertia` A table containing 6 values of the rotational inertia tensor matrix.  The table
  contains the 3 diagonal elements of the matrix (upper left to bottom right), followed by the 3
  elements of the upper right portion of the 3x3 matrix.  Six values can also be passed instead of a
  table.

### Returns

Nothing

See also
---

- `Collider:getMass`
- `Collider:setMass`
- `Collider:getMassData`
- `Shape:getMass`
