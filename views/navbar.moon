import Widget from require 'lapis.html'

Logo = require 'views.logo'

class Navbar extends Widget
  content: =>
    nav ->
      if @logo ~= false
        div class: 'logo', ->
          a href: @prefix .. '/', ->
            widget Logo
            span 'LÖVR'

      div class: 'links container', ->
        a href: @prefix .. '/docs', 'Documentation'
        a href: 'https://github.com/bjornbytes/lovr', target: '_blank', 'Source'
