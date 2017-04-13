import Widget from require 'lapis.html'

class Layout extends Widget
  content: =>
    html_5 ->
      head ->
        meta charset: 'utf-8'
        title (@page and (@page\gsub('_', ' ') .. ' - ') or '')
        link rel: 'stylesheet', href: 'https://fonts.googleapis.com/css?family=Varela+Round'
        link rel: 'stylesheet', href: 'https://fonts.googleapis.com/css?family=Inconsolata'
        link rel: 'stylesheet', href: @prefix .. '/static/css/lovr.css'
        link rel: 'stylesheet', href: @prefix .. '/static/css/tomorrow-night-blue.css'
        link rel: 'shortcut icon', href: @prefix .. '/static/img/favicon.png'

        @content_for 'head'

      body ->
        script type: 'text/javascript', ->
          raw 'var prefix = "' .. @prefix .. '";'

        @content_for 'inner'
