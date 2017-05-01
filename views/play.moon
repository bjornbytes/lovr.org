import Widget from require 'lapis.html'

Navbar = require 'views.navbar'

class Play extends Widget
  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: '/static/css/play.css'

    widget Navbar

    main class: 'play', ->
      div class: 'wrapper', ->
        iframe src: "/embed/#{@id}"
