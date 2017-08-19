<!--
category: guide
-->

Callbacks
===

In the previous example we wrote some code in the `lovr.draw` function to draw text on the screen.
This is an example of a **callback** because we wrote a function and LÖVR "called back" into that
function later.  Defining a callback lets you specify how your project behaves when a specific event
occurs.

There are all sorts of callbacks that can be used for interesting things.  For example, the
`lovr.controllerpressed` callback is called every time a button on a controller is pressed and lets
you respond to user input.  The three most used callbacks are:

1. `lovr.load` is called once when the app starts.  It is a great time to load assets, define the
initial state of objects in the scene, and perform any other necessary setup work.
2. `lovr.update`, called continuously to update the app.  Often it is used to simulate physics or
update the state of objects, timers, or AI.
3. `lovr.draw`, called once for each eye continuously, used to render a single frame.

By defining different callbacks you can start to easily define the behavior of an app.

`lovr.load` is a great place to load assets, define the initial state of objects in the scene, and
perform any other necessary setup work.

`lovr.update` is often used to update game state.  You might perform physics calculations, move
objects around, or update timers or AI.

`lovr.draw` is a good place to use `lovr.graphics` functions to render objects in the app.
