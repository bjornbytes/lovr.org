import Widget from require 'lapis.html'

Logo = require 'views.logo'

class Navbar extends Widget
  content: =>
    nav ->
      div class: 'logo', ->
        a href: @prefix .. '/', ->
          widget Logo
          span 'LÖVR'

      div class: 'links', ->
        a href: @prefix .. '/docs', 'Documentation'
        a href: @prefix .. '/share', 'Share'
        a href: 'https://github.com/bjornbytes/lovr', target: '_blank', 'GitHub'
