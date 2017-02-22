<!--
category: reference
-->

Transform
===

A Transform represents a translation, rotation, and scale in 3D space.  They're commonly used to
describe how entities are arranged in a scene, or how a camera is oriented.

<table>
<tr>
  <td class="pre">lovr.math.newTransform</td>
  <td>Create a new Transform.</td>
</tr>

<tr>
  <td class="pre">Transform:clone</td>
  <td>Return a copy of the Transform.</td>
</tr>

<tr>
  <td class="pre">Transform:inverse</td>
  <td>Return the inverse of the Transform.</td>
</tr>

<tr>
  <td class="pre">Transform:apply</td>
  <td>Apply one Transform to another.</td>
</tr>

<tr>
  <td class="pre">Transform:origin</td>
  <td>Reset the Transform to the origin.</td>
</tr>

<tr>
  <td class="pre">Transform:translate</td>
  <td>Translate the Transform along the x, y, and z axes.</td>
</tr>

<tr>
  <td class="pre">Transform:rotate</td>
  <td>Rotate the Transform around an axis.</td>
</tr>

<tr>
  <td class="pre">Transform:scale</td>
  <td>Scale the Transform along the x, y, and z axes.</td>
</tr>

<tr>
  <td class="pre">Transform:setTransformation</td>
  <td>Set the position, scale, and rotation of the Transform using a single function.</td>
</tr>

<tr>
  <td class="pre">Transform:transformPoint</td>
  <td>Apply the Transform to a point.</td>
</tr>

<tr>
  <td class="pre">Transform:inverseTransformPoint</td>
  <td>Apply the inverse of the Transform to a point.</td>
</tr>
</table>
