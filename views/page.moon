import Widget from require 'lapis.html'

class Page extends Widget
  sidebar_link: (key, label, hidden, isExample) =>
    li ->
      a class: { 'disabled', active: key == @page, :hidden }, ['data-key']: key, ['data-example']: @isDefaultVersion and isExample and key, ->
        text label\gsub('_', ' ') or ''

  sidebar: =>
    div class: 'sidebar', ->
      input class: 'search'

      aside class: 'alias-message'

      @sidebar_content!

    div class: 'sidebar-toggle', ->
      span class: 'arrow'
