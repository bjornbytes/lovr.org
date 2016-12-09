<!--
category: reference
-->

lovr.filesystem.write
===

Write to a file.

    bytes = lovr.filesystem.write(filename, content)

### Arguments

- `string filename` The file to write to.
- `string content` A string to write to the file.

### Returns

- `number bytes` The number of bytes written.

Notes
---

If the file does not exist, it is created.
