import Widget from require 'lapis.html'

Navbar = require 'views.navbar'
Logo = require 'views.logo'

class Index extends Widget
  content: =>
    @content_for 'head', ->
      meta name: 'twitter:card', content: 'summary'
      meta name: 'twitter:title', content: 'LÖVR'
      meta name: 'twitter:description', content: 'A simple framework for creating VR with Lua.'
      meta name: 'twitter:image', content: 'http://lovr.org/static/img/logo.png'
      link rel: 'stylesheet', href: '/static/css/index.css'

    widget Navbar
    main class: 'index container', ->
      widget Logo

      h1 'LÖVR'
      p 'A simple framework for creating VR with Lua'

      div class: 'buttons', ->
        a href: '/static/f/lovr.zip', 'Download'
        a href: '/docs', 'Get Started'

      div class: 'thirds', ->
        div class: 'third', ->
          h3 (-> span 'aria-hidden': true, '📦'), 'Cross Platform'
          p 'LÖVR projects work on Windows, macOS, and Linux.  You can run the same code on an HTC Vive or '..
            'an Oculus Rift, and you can even export projects to WebVR.'

        div class: 'third', ->
          h3 (-> span 'aria-hidden': true, '🌈'), 'Super Simple'
          p 'LÖVR is minimal, clean, and really easy to pick up.  It\'s scripted with Lua, a fun '..
            'little scripting language.  Most common tasks are reduced to just a few lines of code, and '..
            'everything is designed for VR.'

        div class: 'third', ->
          h3 (-> span 'aria-hidden': true, '💜'), 'Open Source'
          p 'LÖVR is open source software, meaning it\'s 100% free to use and doesn\'t require accounts, paid licenses, '..
            'or royalties.  The code can be found on GitHub and is released '..
            'under the MIT license.'

      h2 'Samples'
      div class: 'samples', ->
        div class: 'sample', ->
          h4 'Hello World'
          pre class: 'hljs lua', ->
            span class: 'hljs-function', ->
              span class: 'hljs-keyword', 'function '
              span class: 'hljs-title', 'lovr.draw'
              span class: 'hljs-params', '()'

            text '\n  lovr.graphics.print('
            span class: 'hljs-string', '\'oh wow\''
            text ', '
            span class: 'hljs-number', '0'
            text ', '
            span class: 'hljs-number', '2'
            text ', '
            span class: 'hljs-number', '-3'
            text ', '
            span class: 'hljs-number', '.5'
            text ')\n'
            span class: 'hljs-keyword', 'end'

        div class: 'sample', ->
          h4 'Spatialized Audio'
          pre class: 'hljs lua', ->
            span class: 'hljs-function', ->
              span class: 'hljs-keyword', 'function '
              span class: 'hljs-title', 'lovr.load'
              span class: 'hljs-params', '()'

            text '\n  sound = lovr.audio.newSource('

            span class: 'hljs-string', '\'darude.ogg\')'
            text '\n  sound:play()'
            span class: 'hljs-keyword', '\nend'

        div class: 'sample', ->
          h4 'Tracked Controllers'
          pre class: 'hljs lua', ->
            span class: 'hljs-function', ->
              span class: 'hljs-keyword', 'function '
              span class: 'hljs-title', 'lovr.draw'
              span class: 'hljs-params', '()'

            text '\n  controllers = lovr.headset.getControllers()'
            span class: 'hljs-keyword', '\n\n  for'
            text ' _, controller'
            span class: 'hljs-keyword', ' in'
            span class: 'hljs-built_in', ' ipairs'
            text '(controllers)'
            span class: 'hljs-keyword', ' do'

            text '\n    x, y, z = controller:getPosition()'
            text '\n    lovr.graphics.sphere(x, y, z,'
            span class: 'hljs-number', ' .1'
            text ')'
            span class: 'hljs-keyword', '\n  end\nend'

        div class: 'sample', ->
          h4 'Skybox'
          pre class: 'hljs lua', ->
            span class: 'hljs-function', ->
              span class: 'hljs-keyword', 'function '
              span class: 'hljs-title', 'lovr.load'
              span class: 'hljs-params', '()'

            text '\n  skybox = lovr.graphics.newTexture('
            span class: 'hljs-string', '\'sky.jpg\''
            text ')'
            span class: 'hljs-keyword', '\nend\n\n'

            span class: 'hljs-function', ->
              span class: 'hljs-keyword', 'function '
              span class: 'hljs-title', 'lovr.draw'
              span class: 'hljs-params', '()'

            text '\n  angle, ax, ay, az = lovr.headset.getOrientation()'
            text '\n  lovr.graphics.skybox(skybox, -angle, ax, ay, az)'
            span class: 'hljs-keyword', '\nend'

      h2 'Screenshots'
      div class: 'screenshots thirds', ->
        div class: 'third', ->
          img src: '/static/img/wattle.jpg'

        div class: 'third', ->
          img src: '/static/img/levrage.jpg'

        div class: 'third', ->
          img src: '/static/img/planets.jpg'

    script -> raw [[var s = document.querySelector('main svg'); setTimeout(function(){s.style.display = 'inline-block';}, 0);]]
