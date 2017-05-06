360 Image
===

<!-- code -->

LÖVR can load and render 360 photos using the built in Skybox object.  Here, we create a new Skybox
using `lovr.graphics.newSkybox` and pass in the filename of an image with a standard equirectangular
projection.  To render the skybox, we call `skybox:draw` and pass it the orientation of the headset
(with a negative angle) so it renders correctly as the headset moves.

Note that Skyboxes render as "backgrounds" so they should be drawn at the beginning of `lovr.draw`.
They don't have any parallax either, meaning they'll always appear to be very far away in the scene.
