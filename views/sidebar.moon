import Widget from require 'lapis.html'

class Sidebar extends Widget
  link: (key) =>
    li class: { 'disabled', active: key == @page }, tabindex: '0', ['data-doc']: key, ->
      text key\gsub('_', ' ') or ''

  content: =>
    div class: 'sidebar', ->
      div class: 'wrapper', ->
        input class: 'search'

        h2 'Guides'
        ul ->
          @link 'Introduction'
          @link 'Getting_Started'
          @link 'How_to_Lua'
          @link 'Callbacks'
          @link 'Simple_Shapes'
          @link '3D_Models'
          @link 'Controllers'
          @link 'Sound'
          @link 'Game_Distribution'

        h2 'Modules'
        ul ->
          @link 'lovr'
          @link 'lovr.audio'
          @link 'lovr.event'
          @link 'lovr.filesystem'
          @link 'lovr.graphics'
          @link 'lovr.headset'
          @link 'lovr.math'
          @link 'lovr.timer'

        h2 'Callbacks'
        ul ->
          @link 'lovr.conf'
          @link 'lovr.controlleradded'
          @link 'lovr.controllerpressed'
          @link 'lovr.controllerreleased'
          @link 'lovr.controllerremoved'
          @link 'lovr.draw'
          @link 'lovr.errhand'
          @link 'lovr.focus'
          @link 'lovr.load'
          @link 'lovr.quit'
          @link 'lovr.run'
          @link 'lovr.update'

        h2 'Reference'
        ul ->
          for i, key in ipairs @reference do
            @link key
