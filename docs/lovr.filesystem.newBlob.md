<!--
category: reference
-->

lovr.filesystem.newBlob
===

Creates a new Blob.  A Blob is an object that represents the contents of a file.  It can be passed
to most functions that create objects from file data, such as `lovr.graphics.newModel` and
`lovr.audio.newSource`.  Loading many objects in this way is often faster because the file data
only needs to be read once and can be reused.  It can also be useful if file data is retrieved from
some non-filesystem source, such as a network request.

---

    blob = lovr.filesystem.newBlob(filename)

### Arguments

- `string filename` The file to load.

### Returns

- `Blob blob` The new Blob.

---

    blob = lovr.filesystem.newBlob(str, name)

### Arguments

- `string str` The contents of the Blob.
- `string name` A name for the Blob (used for error messages).

### Returns

- `Blob blob` A new Blob.

See also
---

- `Blob`
