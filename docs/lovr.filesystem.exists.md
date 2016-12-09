<!--
category: reference
-->

lovr.filesystem.exists
===

Determine if a file exists.

    exists = lovr.filesystem.exists(path)

### Arguments

- `string path` The path to check.

### Returns

- `boolean exists` Whether the path is a file or directory.

Notes
---

This function checks both the source directory and the save directory.
