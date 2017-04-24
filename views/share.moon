import Widget from require 'lapis.html'

Navbar = require 'views.navbar'

class Share extends Widget
  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: @prefix .. '/static/css/share.css'

    widget Navbar
    main class: 'share container', ->
      h1 'Share your LÖVR'
      div class: 'drop', ->
        text 'Drop a .lovr file here to turn it into a WebVR app!'

      p ->
        raw 'Need help?  Check out the <a href="' .. @prefix .. '/docs/WebVR">WebVR Guide</a> or the <a href="' .. @prefix .. '/docs/Introduction">LÖVR Introduction</a>.'

    script src: @prefix .. '/static/js/share.js', async: true
