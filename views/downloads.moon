import Widget from require 'lapis.html'

Navbar = require 'views.navbar'

class Downloads extends Widget
  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: '/static/css/downloads.css'

    widget Navbar
    main class: 'downloads container', ->
      widget Navbar

      h1 'Download LÖVR'
      p 'v0.15.0, Government Goop'

      div class: 'box', ->
        h2 (-> span 'aria-hidden': true, '📎'), 'Windows'
        ul ->
          li -> a href: '/download/windows', '64 bit'
          li -> a href: '/download/nightly', 'Nightly (64 bit)'

      div class: 'box', ->
        h2 (-> span 'aria-hidden': true, '🍎'), 'macOS'
        ul ->
          li -> a href: '/download/mac', 'DMG, Sierra+'

      div class: 'box', ->
        h2 (-> span 'aria-hidden': true, '🐧'), 'Linux'
        ul ->
          li -> a href: '/download/linux', 'AppImage, x86_64'

      div class: 'box', ->
        h2 (-> span 'aria-hidden': true, '🤖'), 'Android '
        ul ->
          li -> a href: '/download/android', 'APK, Oculus'

      div class: 'box', ->
        h2 (-> span 'aria-hidden': true, '📜'), 'Source'
        ul ->
          li -> a href: 'https://github.com/bjornbytes/lovr', 'Source code'
