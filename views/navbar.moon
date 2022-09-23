import Widget from require 'lapis.html'

Logo = require 'views.logo'

class Navbar extends Widget
  content: =>
    nav ->
      div class: 'logo', ->
        a href: '/', ->
          widget Logo
          span 'LÖVR'

      div class: 'links', ->
        a href: '/docs', 'Documentation'
        a href: '/downloads', 'Downloads'

        div class: 'spacer'

        a href: 'https://github.com/bjornbytes/lovr', target: '_blank', rel: 'noopener', -> i class: 'icon-github'
        a href: 'https://lovr.org/slack', target: '_blank', rel: 'noopener', -> i class: 'icon-slack'
        a href: 'https://lovr.org/matrix', target: '_blank', rel: 'noopener', -> i class: 'icon-matrix-org'
        a href: 'https://fosstodon.org/@lovr', target: '_blank', rel: 'noopener', -> i class: 'icon-mastodon'
