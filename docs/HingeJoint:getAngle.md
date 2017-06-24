<!--
category: reference
-->

HingeJoint:getAngle
===

Get the angle between the two colliders attached to this Joint.  When the joint is created or when
the anchor or axis is set, the current angle is the new "zero" angle.

    angle = hinge:getAngle()

### Arguments

None

### Returns

- `number angle` The hinge angle.

See also
---

- `HingeJoint`
- `HingeJoint:getLowerLimit`
- `HingeJoint:setLowerLimit`
- `HingeJoint:getUpperLimit`
- `HingeJoint:setUpperLimit`
- `HingeJoint:getLimits`
- `HingeJoint:setLimits`
