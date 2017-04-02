<!--
category: reference
-->

lovr.filesystem.mount
===

Mount a directory or .zip file.  This adds it to the virtual filesystem, allowing you to read files
from it.

    success = lovr.filesystem.mount(path)

### Arguments

- `string path` The path to mount.
- `string mountpoint ('/')` The "mountpoint" for the archive (where the files will be accessed
  under).
- `boolean appendToPath (false)` Whether the archive will be added to the beginning or end of the
  search path.  This controls whether or not the files in the archive will take priority over other
  files with the same name.

### Returns

- `boolean success` Whether or not the operation was successful.

Example
---

```
-- Assuming data.zip contains a file 'background.png'
lovr.filesystem.mount('data.zip', 'assets')
print(lovr.filesystem.exists('assets/background.png')) -- true
```

See Also
---

- `lovr.filesystem.unmount`
