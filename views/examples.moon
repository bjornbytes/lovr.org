import Widget from require 'lapis.html'

Navbar = require 'views.navbar'

class Examples extends require 'views.page'
  sidebar_content: =>
    h2 'Graphics'
    ul ->
      @sidebar_link 'Spheres'

  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: 'https://fonts.googleapis.com/css?family=Inconsolata'
      link rel: 'stylesheet', href: '/static/css/examples.css'
      link rel: 'stylesheet', href: '/static/css/tomorrow-night-blue.css'

    @content_for 'sidebar', ->

    widget Navbar
    @sidebar!

    main class: 'docs', ->
      div class: 'content', ['data-key']: @page, ->
        raw @contents

    script src: '/static/js/docs.js', async: true
