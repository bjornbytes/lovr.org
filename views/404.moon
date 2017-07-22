import Widget from require 'lapis.html'

Navbar = require 'views.navbar'
Logo = require 'views.logo'

class Oops extends Widget
  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: '/static/css/index.css'

    widget Navbar
    main class: 'index container', ->
      widget Logo
      h1 'Oops!'
      p 'Page not found.'
