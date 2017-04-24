import Widget from require 'lapis.html'

Navbar = require 'views.navbar'

class Play extends Widget
  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: @prefix .. '/static/css/play.css'

    widget Navbar
    main class: 'play container', ->
      canvas id: 'canvas'

    script src: @prefix .. '/static/js/play.js'
    script src: @prefix .. "/static/play/#{@id}.js"
    script src: @prefix .. '/static/js/webvr-polyfill.min.js'
    script src: @prefix .. '/static/js/lovr.js', async: true
