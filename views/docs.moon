import Widget from require 'lapis.html'

Navbar = require 'views.navbar'
Sidebar = require 'views.sidebar'

class Docs extends Widget
  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: 'https://fonts.googleapis.com/css?family=Inconsolata'
      link rel: 'stylesheet', href: @prefix .. '/static/css/docs.css'
      link rel: 'stylesheet', href: @prefix .. '/static/css/tomorrow-night-blue.css'

    widget Navbar
    widget Sidebar

    main class: 'docs', ->
      print @page
      div class: 'content', ['data-key']: @page, ->
        raw @contents

    script src: @prefix .. '/static/js/lovr.js', async: true
