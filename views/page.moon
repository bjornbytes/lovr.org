import Widget from require 'lapis.html'

class Page extends Widget
  sidebar_link: (key) =>
    li class: { 'disabled', active: key == @page }, ['data-key']: key, ->
      text key\gsub('_', ' ') or ''

  example_link: (key) =>
    li class: { 'disabled', active: key == @page }, ['data-key']: key, ['data-embed']: key, ->
      text key\gsub('_', ' ') or ''

  sidebar: =>
    div class: 'sidebar', ->
      input class: 'search'

      @sidebar_content!

    div class: 'sidebar-toggle', ->
      span class: 'arrow'
