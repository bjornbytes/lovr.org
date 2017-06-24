<!--
category: reference
-->

Shape:getMass
===

Computes the mass properites of the shape.

    cx, cy, cz, mass, inertia = shape:getMass(density)

### Arguments

- `number density` The density parameter of the shape, in kilograms per cubic meter.

### Returns

- `number cx` The x position of the center of mass of the shape.
- `number cy` The y position of the center of mass of the shape.
- `number cz` The z position of the center of mass of the shape.
- `number mass` The computed mass of the shape.
- `table inertia` A table containing 6 values of the rotational inertia tensor matrix.  The table
  contains the 3 diagonal elements of the matrix (upper left to bottom right), followed by the 3
  elements of the upper right portion of the 3x3 matrix.

See also
---

- `Collider:getMass`
- `Collider:setMass`
- `Collider:getMassData`
- `Collider:setMassData`
