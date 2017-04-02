<!--
category: reference
-->

lovr.filesystem.remove
===

Remove a file or directory (in the save folder).  A directory can only be removed if it is empty.

    success = lovr.filesystem.remove(path)

### Arguments

- `string path` The file or folder to remove.

### Returns

- `boolean success` Whether or not the operation was successful.
