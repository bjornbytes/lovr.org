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

        a href: 'https://github.com/bjornbytes/lovr', target: '_blank', rel: 'noopener', 'GitHub'
        a href: 'https://lovr.org/slack', target: '_blank', rel: 'noopener', 'Slack'
        a href: 'https://twitter.com/bjornbytes', target: '_blank', rel: 'noopener', 'Twitter'
