import Widget from require 'lapis.html'

class Embed extends Widget
  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: '/static/css/embed.css'

    canvas id: 'canvas'
    button class: 'vr-toggle', 'Enter VR'

    script src: '/static/js/embed.js'
    script src: '/static/js/lovr.js', async: true
    script src: @bundle if @bundle
