import Widget from require 'lapis.html'

Navbar = require 'views.navbar'
Logo = require 'views.logo'

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
