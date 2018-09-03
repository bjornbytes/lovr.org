import Widget from require 'lapis.html'
mde = require 'markdown_extra'
Notes = require 'widgets.notes'
Related = require 'widgets.related'

class Enum extends Widget
  content: =>
    h1 @key
    raw mde.from_string @description

    element 'table', ->
      thead ->
        tr ->
          td 'Value'
          td 'Description'

      tbody ->
        for value in *@values
          tr ->
            td class: 'pre', value.name
            td value.description

    widget Notes notes: @notes
    widget Related related: @related
