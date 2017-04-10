<!--
category: reference
-->

Blob
===

A Blob is an object that represents the contents of a file.  It can be passed to most functions that
create objects from file data, such as `lovr.graphics.newModel` and `lovr.audio.newSource`.  Loading
many objects in this way is often faster because the file data only needs to be read once and can be
reused.  It can also be useful if file data is retrieved from some non-filesystem source, such as a
network request.

Functions
---

<table>
<tr>
  <td class="pre">lovr.filesystem.newBlob</td>
  <td>Create a Blob from a file or raw data.</td>
</tr>

<tr>
  <td class="pre">Blob:getFilename</td>
  <td>Return the name of the file used to load the Blob (or the user-defined name).</td>
</tr>

<tr>
  <td class="pre">Blob:getPointer</td>
  <td>Return a raw pointer to the Blob's data.</td>
</tr>

<tr>
  <td class="pre">Blob:getSize</td>
  <td>Return the size of the Blob's data, in bytes.</td>
</tr>

<tr>
  <td class="pre">Blob:getString</td>
  <td>Return a string containing the binary blob data.</td>
</tr>
</table>
