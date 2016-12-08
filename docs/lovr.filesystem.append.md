<!--
category: reference
-->

lovr.filesystem.append
---

Appends content to the end of the file.

    bytes = lovr.filesystem.append(filename, content)

#### Arguments

- `string filename` The file to append to.
- `string content` A string to write to the end of the file.

#### Returns

- `number bytes` The number of bytes written.

#### Notes

If the file does not exist, it is created.
