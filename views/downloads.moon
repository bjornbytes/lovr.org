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
      p 'v0.14.0, Maximum Moss'

      div class: 'box', ->
        h2 (-> span 'aria-hidden': true, '📎'), 'Windows'
        ul ->
          li -> a href: '/download/windows/64', '64 bit'
          --li -> a href: '/download/windows/32', '32 bit'
          li -> a href: '/download/nightly', 'Nightly (64 bit)'

      div class: 'box', ->
        h2 (-> span 'aria-hidden': true, '🍎'), 'macOS'
        ul ->
          li -> a href: '/download/mac', '64 bit, Sierra+'

      div class: 'box', ->
        h2 (-> span 'aria-hidden': true, '🤖'), 'Android (Oculus)'
        ul ->
          li -> a href: '/download/android', '64 bit'

      div class: 'box', ->
        h2 (-> span 'aria-hidden': true, '📜'), 'Source'
        ul ->
          li -> a href: 'https://github.com/bjornbytes/lovr', 'Source code'
