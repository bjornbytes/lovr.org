import Widget from require 'lapis.html'

Navbar = require 'views.navbar'

class Docs extends require 'views.page'
  sidebar_content: =>
    h2 'Guides'
    ul ->
      @sidebar_link 'Introduction'
      @sidebar_link 'Getting_Started'
      @sidebar_link 'How_to_Lua'
      @sidebar_link 'Callbacks'
      @sidebar_link 'Simple_Shapes'
      @sidebar_link '3D_Models'
      @sidebar_link 'Controllers'
      @sidebar_link 'Sound'
      @sidebar_link 'Game_Distribution'
      @sidebar_link 'WebVR'

    h2 'Modules'
    ul ->
      @sidebar_link 'lovr'
      @sidebar_link 'lovr.audio'
      @sidebar_link 'lovr.event'
      @sidebar_link 'lovr.filesystem'
      @sidebar_link 'lovr.graphics'
      @sidebar_link 'lovr.headset'
      @sidebar_link 'lovr.math'
      @sidebar_link 'lovr.physics'
      @sidebar_link 'lovr.timer'

    h2 'Callbacks'
    ul ->
      @sidebar_link 'lovr.conf'
      @sidebar_link 'lovr.controlleradded'
      @sidebar_link 'lovr.controllerpressed'
      @sidebar_link 'lovr.controllerreleased'
      @sidebar_link 'lovr.controllerremoved'
      @sidebar_link 'lovr.draw'
      @sidebar_link 'lovr.errhand'
      @sidebar_link 'lovr.focus'
      @sidebar_link 'lovr.load'
      @sidebar_link 'lovr.quit'
      @sidebar_link 'lovr.run'
      @sidebar_link 'lovr.update'

    h2 'Reference'
    ul ->
      for i, key in ipairs @reference do
        @sidebar_link key

  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: '/static/css/docs.css'

    widget Navbar
    @sidebar!

    main class: 'docs', ->
      div class: 'content', ['data-key']: @page, ->
        raw @contents

    script type: 'text/javascript', -> raw "window.config = { base: '/docs', api: '/api/docs' };"
    script src: '/static/js/docs.js', async: true
