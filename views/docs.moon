import Widget from require 'lapis.html'

config = require('lapis.config').get!

Navbar = require 'views.navbar'

class Docs extends Widget
  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: config.env == 'prod' and '/static/css/docs.css' or '/static/css/docs-dev.css'

    widget Navbar

    div class: 'sidebar', ->

      element 'select', class: 'versions', onchange: 'window.location.href=this.options[this.selectedIndex].value', ->
        option selected: true, value: "/docs/#{@version}", @version
        for v in *@versions
          if v ~= @version
            option value: "/docs/#{v}", v

      input class: 'search', spellcheck: 'false'

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
                  a class: classes, href: href, ['data-key']: key, ['data-embed']: embed and key, tabIndex: 0, ->
                    text label and label\gsub('_', ' ') or ''
                  if group
                    ul ->
                      for subkey in *group
                        link subkey

              link key

      renderCategory 'guides'
      --renderCategory 'showcase'
      renderCategory 'examples'
      renderCategory 'modules'
      renderCategory 'objects'
      renderCategory 'callbacks'
      renderCategory 'functions'
      renderCategory 'types'

    div class: 'sidebar-toggle', ->
      span class: 'arrow'

    main class: 'docs', ->
      div class: 'content', ['data-key']: @page, ->
        raw @contents

    script src: '/static/js/highlight.min.js'
    script src: '/static/js/oboe.min.js'
    script src: '/static/js/docs.js', async: true
