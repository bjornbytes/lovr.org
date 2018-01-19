import Widget from require 'lapis.html'
mde = require 'markdown_extra'

class Examples extends Widget
  content: =>
    if @examples
      h2 #@examples == 1 and 'Example' or 'Examples'
      for example in *@examples
        raw mde.from_string example.description if example.description
        pre ->
          code example.code
