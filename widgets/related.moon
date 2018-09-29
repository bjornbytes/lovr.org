import Widget from require 'lapis.html'

class Related extends Widget
  content: =>
    return if #@related == 0
    h2 'See also'
    ul ->
      for key in *@related
        li ->
          code key
