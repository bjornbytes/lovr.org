import Widget from require 'lapis.html'

Navbar = require 'views.navbar'

class Share extends Widget
  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: '/static/css/share.css'

    widget Navbar
    main class: 'share container', ->
      h1 'Share your LÖVR'
      aside 'This feature is in the process of being replaced.  Don\'t use it as a long term solution!'
      div class: 'drop', ->
        div class: 'message', 'Drop a .lovr file here to turn it into a WebVR app!'
        div class: 'progress', ->
          span ''

      p ->
        raw 'Need help?  Check out the <a href="/docs/Distribution">Distribution Guide</a> or the <a href="/docs/Getting_Started">Getting Started</a> guide.'

    script src: '/static/js/share.js', async: true
