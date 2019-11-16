Navbar = require 'views.navbar'

class Docs extends require 'views.page'
  sidebar_content: =>
    hide = (link) ->
      link\match('^%w+Joint$') or link\match('^%w+Shape$')

    labelFor = (link) ->
      (link == 'Joint' or link == 'Shape') and (link .. 's') or link

    isHidden = (category) ->
      category == 'functions' or category == 'types'

    renderCategory = (category) ->
      hidden = isHidden category
      section class: { :hidden, category }, ->
        h2 category\gsub('^%l', string.upper) or ''
        ul ->
          for link in *@categories[category]
            @sidebar_link link, (labelFor link), (hide link), (category == 'examples' or category == 'showcase')

    renderCategory 'guides'
    renderCategory 'showcase'
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
      div class: 'embed', -> iframe allowvr: true, allowfullscreen: true if @isDefaultVersion
      div class: 'content', ['data-key']: @page, ->
        raw @contents

    script src: '/static/js/docs.js', async: true
