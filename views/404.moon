import Widget from require 'lapis.html'

Navbar = require 'views.navbar'
Logo = require 'views.logo'

class NotFound extends Widget
  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: '/static/css/error.css'

    widget Navbar
    main class: 'error error-404 container', ->
      h1 '4Ö4'
      p 'Page not found.'
