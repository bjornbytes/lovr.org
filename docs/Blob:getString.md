<!--
category: reference
-->

Blob:getString
===

Get the binary data of the Blob.

    data = blob:getString()

### Arguments

None

### Returns

- `string data` The Blob data.

Example
---

Manually copy a file using Blobs:

```
blob = lovr.filesystem.newBlob('image.png')
lovr.filesystem.write('copy.png', blob:getString())
```
