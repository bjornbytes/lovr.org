import Widget from require 'lapis.html'

class Embed extends Widget
  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: '/static/css/embed.css'

    canvas id: 'canvas'
    button class: 'vr-toggle', 'Enter VR'

    script type: 'text/javascript', -> raw [[
      window.WebVRConfig = {
        BUFFER_SCALE: 1,
        MOUSE_KEYBOARD_CONTROLS_DISABLED: false
      };
    ]]

    script src: '/static/js/embed.js'
    script src: '/static/js/webvr-polyfill.min.js'
    script src: "/#{@file}"
    script src: '/static/js/lovr.js', async: true
