mde = require 'markdown_extra'
import Widget from require 'lapis.html'

class Notes extends Widget
  content: =>
    if @notes
      h2 'Notes'
      raw mde.from_string @notes
