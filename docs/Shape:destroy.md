<!--
category: reference
-->

Shape:destroy
===

Destroy the shape, freeing any associated resources and removing it from any colliders it's attached
to.

    shape:destroy()

### Arguments

None

### Returns

Nothing

Notes
---

Calling functions on the shape after destroying it is a bad idea.

See also
---

- `World:destroy`
- `Collider:destroy`
- `Joint:destroy`
