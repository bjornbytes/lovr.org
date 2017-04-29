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
        a href: '/docs', 'Learn More'
