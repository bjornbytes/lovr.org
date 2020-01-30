import Widget from require 'lapis.html'

Navbar = require 'views.navbar'
Logo = require 'views.logo'

class Oops extends Widget
  content: =>
    @content_for 'head', ->
      link rel: 'stylesheet', href: '/static/css/error.css'

    widget Navbar
    main class: 'error container', ->
      img src: '/static/img/hangryGoose.png', class: 'hero'
      h1 '5ÖÖ'
      p ->
        text 'The website is broken.  You should probably tell '
        a href: 'https://twitter.com/bjornbytes', target: '_blank', '@bjornbytes'
        text '.'
