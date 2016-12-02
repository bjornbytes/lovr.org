lovr.event.push
---

Pushes an event onto the event queue.  It will be processed the next time `lovr.event.poll` is
called.  Custom events require an entry in the `lovr.handlers` table.

    lovr.event.push(name, ...)

#### Arguments

- `string name` The name of the event.
- `...` The arguments for the event.

#### Returns

- Nothing
