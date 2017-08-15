import Widget from require 'lapis.html'

Navbar = require 'views.navbar'
Logo = require 'views.logo'

samples = {
[[function lovr.draw()
  lovr.graphics.print('oh wow', 0, 2, -3, .5)
end]],

[[function lovr.load()
  sound = lovr.audio.newSource('darude.ogg')
  sound:play()
end]],

[[function lovr.draw()
  controllers = lovr.headset.getControllers()
  for i, controller in ipairs(controllers) do
    x, y, z = controller:getPosition()
    lovr.graphics.sphere(x, y, z, .1)
  end
end]],

[[function lovr.load()
  skybox = lovr.graphics.newSkybox('sky.jpg')
end

function lovr.draw()
  skybox:draw(lovr.headset.getOrientation())
end]]
}

class Index extends Widget
  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: '/static/css/index.css'

    widget Navbar
    main class: 'index container', ->
      widget Logo

      h1 'LÖVR'
      p 'A simple framework for creating VR experiences'

      div class: 'buttons', ->
        a href: 'http://bjornbyt.es/f/lovr.zip', 'Download'
        a href: '/docs', 'Get Started'

      div class: 'thirds', ->
        div class: 'third', ->
          h3 (-> span '📦'), 'Cross Platform'
          p 'LÖVR works on Windows, macOS, and Linux.  You can run the same code on an HTC Vive or
            an Oculus Rift.  There\'s even a drag and drop WebVR exporter to export projects to the
            web!'

        div class: 'third', ->
          h3 (-> span '🌈'), 'Super Simple'
          p 'LÖVR is minimal, clean, and really easy to pick up.  It\'s scripted with Lua, a fun
            little scripting language.  Most tasks are reduced to just a few lines of code, and
            everything is designed for VR.'

        div class: 'third', ->
          h3 (-> span '💜'), 'Open Source'
          p 'LÖVR is open source software.  It\'s 100% free to use and doesn\'t require any
            licensing, royalties, or accounts.  The code is available on GitHub and is released
            under the MIT license.'

      h2 'Samples'
      div class: 'samples', ->
        div class: 'sample', ->
          h4 'Render Text'
          pre samples[1]

        div class: 'sample', ->
          h4 'Play Sounds'
          pre samples[2]

        div class: 'sample', ->
          h4 'Tracked Controllers'
          pre samples[3]

        div class: 'sample', ->
          h4 'Skybox'
          pre samples[4]
