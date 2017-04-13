import Widget from require 'lapis.html'

Navbar = require 'views.navbar'
Sidebar = require 'views.sidebar'

class Docs extends Widget
  content: =>
    widget Navbar
    widget Sidebar

    main class: 'docs', ->
      print @page
      div class: 'content', ['data-key']: @page, ->
        raw @contents

    script src: @prefix .. '/static/js/lovr.js', async: true
