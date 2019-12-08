import Widget from require 'lapis.html'

class Footer extends Widget
  content: =>
    footer class: 'container', ->

      section ->
        header 'LÖVR'
        ul ->
          li -> a href: '/', 'Home'
          li -> a href: '/downloads', 'Downloads'
          li -> a href: '/docs', 'Documentation'

      section ->
        header 'Development'
        ul ->
          li -> a href: '/source', 'Source'
          li -> a href: 'https://github.com/bjornbytes/lovr/releases', 'Releases'
          li -> a href: 'https://github.com/bjornbytes/lovr/issues', 'Issues'

      section ->
        header 'Community'
        ul ->
          li -> a href: '/slack', 'Slack'
          li -> a href: '/matrix', 'Matrix'
          li -> a href: '/twitter', 'Twitter'
