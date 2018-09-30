import Widget from require 'lapis.html'

class Page extends Widget
  sidebar_link: (key, label, hidden, isExample) =>
    li ->
      a class: { 'disabled', active: key == @page, :hidden }, ['data-key']: key, ['data-example']: @isDefaultVersion and isExample and key, ->
        text label and label\gsub('_', ' ')\gsub('.+%-', '') or ''

  sidebar: =>
    div class: 'sidebar', ->
      ul class: 'versions', ->
        li class: 'active version', @version
        for v in *@versions
          if v ~= @version
            li class: 'version', ->
              a href: "/docs/#{v}", v

      input class: 'search'

      aside class: 'alias-message'

      @sidebar_content!

    div class: 'sidebar-toggle', ->
      span class: 'arrow'
