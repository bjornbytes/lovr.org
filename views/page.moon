import Widget from require 'lapis.html'

class Page extends Widget
  sidebar_link: (key) =>
    li class: { 'disabled', active: key == @page }, tabindex: '0', ['data-key']: key, ->
      text key\gsub('_', ' ') or ''

  sidebar: =>
    div class: 'sidebar', ->
      div class: 'wrapper', ->
        input class: 'search'

        @sidebar_content!
