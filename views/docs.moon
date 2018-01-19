import Widget from require 'lapis.html'

Navbar = require 'views.navbar'

class Docs extends require 'views.page'
  sidebar_content: =>
    renderCategory = (category) ->
      h2 category\gsub('^%l', string.upper) or ''
      ul -> @sidebar_link(link, category == 'examples') for link in *@categories[category] or {}

    renderCategory 'guides'
    renderCategory 'examples'
    renderCategory 'modules'
    renderCategory 'callbacks'
    renderCategory 'objects'
    renderCategory 'functions'
    renderCategory 'types'

  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: '/static/css/docs.css'
      script ';'

    widget Navbar

    @sidebar!

    main class: 'docs', ->
      div class: 'embed', ->
        div class: 'progress', -> span ''
        iframe allowvr: true

      div class: 'content intro', ['data-key']: @page, ->
        raw @contents

    script src: '/static/js/docs.js', async: true
