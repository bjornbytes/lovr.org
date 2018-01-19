import Widget from require 'lapis.html'

class Related extends Widget
  content: =>
    h2 'See also'
    ul ->
      for key in *@related
        li ->
          code key
