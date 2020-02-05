import Widget from require 'lapis.html'

Navbar = require 'views.navbar'

class Docs extends Widget
  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: '/static/css/docs.css'
      script ';'

    widget Navbar

    div class: 'sidebar', ->
      ul class: 'versions', ->
        li class: 'active version', @version
        for v in *@versions
          if v ~= @version
            li class: 'version', ->
              a href: "/docs/#{v}", rel: 'nofollow', v

      input class: 'search'

      aside class: 'alias-message'

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
            for key in *@categories[category]
              label = labelFor key
              hidden = hide key
              embed = category == 'examples' or category == 'showcase'

              li ->
                a class: { 'disabled', selected: key == @page, :hidden }, href: "/docs/#{@version}/#{key}", ['data-key']: key, ['data-embed']: @isDefaultVersion and embed and key, ->
                  text label and label\gsub('_', ' ')\gsub('.+%-', '') or ''

      renderCategory 'guides'
      renderCategory 'showcase'
      renderCategory 'examples'
      renderCategory 'modules'
      renderCategory 'callbacks'
      renderCategory 'objects'
      renderCategory 'functions'
      renderCategory 'types'

    div class: 'sidebar-toggle', ->
      span class: 'arrow'

    main class: 'docs', ->
      div class: 'embed', -> iframe allowvr: true, allowfullscreen: true if @isDefaultVersion
      div class: 'content', ['data-key']: @page, ->
        raw @contents

    script src: '/static/js/highlight.min.js'
    script src: '/static/js/oboe.min.js'
    script src: '/static/js/docs.js', async: true
