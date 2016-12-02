lovr.event.poll
---

This function returns an iterator for all of the unprocessed items in the event queue.  Each event
consists of a name as a string, followed by event-specific arguments.  Typically this function is
automatically called for you by `lovr.run`.

    iterator = lovr.event.poll()

#### Arguments

- None

#### Returns

- `function iterator` - The iterator function, usable in a for loop.

#### Notes

Example usage from `lovr.run`:

    for event, a, b, c, d in lovr.event.poll() do
      print('new event:', event)
      print('arguments:', a, b, c, d)
    end
