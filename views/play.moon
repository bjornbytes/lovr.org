import Widget from require 'lapis.html'

Navbar = require 'views.navbar'

class Play extends Widget
  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: '/static/css/play.css'

    widget Navbar
    main class: 'play container', ->
      canvas id: 'canvas'

    script src: '/static/js/play.js'
    script src: "/static/play/#{@id}.js"
    script src: '/static/js/webvr-polyfill.min.js'
    script src: '/static/js/lovr.js', async: true
