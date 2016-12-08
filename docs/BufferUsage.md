<!--
category: reference
-->

BufferUsage
---

Buffers can have a usage hint, describing how they are planning on being updated.

#### Values

- `static` The buffer's contents will rarely change.
- `dynamic` The buffer's contents will change often.
- `stream` The buffer's contents will change every frame.
