<!--
category: reference
-->

lovr.filesystem.read
---

Read the contents of a file.

    contents = lovr.filesystem.read(filename)

#### Arguments

- `string filename` The name of the file to read.

#### Returns

- `string contents` The contents of the file.

#### Notes

If the file does not exist, an error is thrown.
