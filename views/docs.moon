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
        link\match('^%w+Joint$') or link\match('^%w+Shape$') or link\match('Vec%d') or link\match('Mat%d') or link == 'Quat'

      labelFor = (link) ->
        (link == 'Joint' or link == 'Shape') and (link .. 's') or link\gsub('.+/', '')

      isHidden = (category) ->
        category == 'functions' or category == 'types'

      renderCategory = (category) ->
        hidden = isHidden category
        section class: { :hidden, category }, ->
          h2 category\gsub('^%l', string.upper) or ''
          ul ->
            for key in *@categories[category]
              link = (key) ->
                label = labelFor key
                group = @categories[category][key]
                embed = not group and (category == 'examples' or category == 'showcase') and @isDefaultVersion
                classes = { disabled: not group, selected: key == @page, hidden: hide key }
                href = not group and "/docs/#{@version}/#{key}"
                li class: { :group }, ->
                  a class: classes, href: href, ['data-key']: key, ['data-embed']: embed and key, ->
                    text label and label\gsub('_', ' ')\gsub('.+%-', '') or ''
                  if group
                    ul ->
                      for subkey in *group
                        link subkey

              link key

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
