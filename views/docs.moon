import Widget from require 'lapis.html'

Navbar = require 'views.navbar'

class Docs extends require 'views.page'
  sidebar_content: =>
    h2 'Guides'
    ul ->
      @sidebar_link 'Getting_Started'
      @sidebar_link 'Callbacks_and_Modules'
      @sidebar_link 'Libraries'
      @sidebar_link 'Distribution'

    h2 'Examples'
    ul ->
      for key in *@categories.example do
        @example_link key

    h2 'Modules'
    ul ->
      for key in *@categories.modules do
        @sidebar_link key

    h2 'Callbacks'
    ul ->
      for key in *@categories.callbacks do
        @sidebar_link key

    h2 'Objects'
    ul ->
      for key in *@categories.objects do
        @sidebar_link key

    h2 'Functions'
    ul ->
      for i, key in ipairs @categories.functions do
        @sidebar_link key

    h2 'Types'
    ul ->
      for i, key in ipairs @categories.enums do
        @sidebar_link key

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
