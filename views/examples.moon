import Widget from require 'lapis.html'

Navbar = require 'views.navbar'

class Examples extends require 'views.page'
  sidebar_content: =>
    h2 'Examples'
    ul ->
      for i, key in ipairs @examples do
        @sidebar_link key

  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: '/static/css/examples.css'

    widget Navbar
    @sidebar!

    main class: 'examples', ->
      div class: 'preview', ->
        div class: 'progress', -> span ''

      if @page
        div class: 'content', ['data-key']: @page, ->
          raw @contents
      else
        div class: 'content all', ->
          for i, key in ipairs @examples do
            div class: 'tile', ['data-key']: key, ->
              img src: '/static/img/examples/' .. key .. '.jpg'
              div class: 'title', true and key\gsub('_', ' ')

    script type: 'text/javascript', -> raw "window.config = { base: '/examples', api: '/api/examples' };"
    script src: '/static/js/docs.js', async: true
