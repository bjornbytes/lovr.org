import Widget from require 'lapis.html'

class Layout extends Widget
  content: =>
    html_5 ->
      head ->
        meta charset: 'utf-8'
        meta name: 'description', content: 'A simple framework for creating VR with Lua.'
        meta name: 'viewport', content: 'width=device-width, initial-scale=1.0'
        title (@page and (@page\gsub('_', ' ') .. ' - ') or '') .. 'LÖVR'
        link rel: 'shortcut icon', href: '/static/img/favicon.png'

        @content_for 'head'

      body ->
        @content_for 'inner'
