<!--
category: reference
-->

Collider:getMassData
===

Computes the mass properites of the collider.

    cx, cy, cz, mass, inertia = collider:getMassData()

### Arguments

None

### Returns

- `number cx` The x position of the center of mass of the collider.
- `number cy` The y position of the center of mass of the collider.
- `number cz` The z position of the center of mass of the collider.
- `number mass` The computed mass of the collider.
- `table inertia` A table containing 6 values of the rotational inertia tensor matrix.  The table
  contains the 3 diagonal elements of the matrix (upper left to bottom right), followed by the 3
  elements of the upper right portion of the 3x3 matrix.

See also
---

- `Collider:getMass`
- `Collider:setMass`
- `Collider:setMassData`
- `Shape:getMass`
