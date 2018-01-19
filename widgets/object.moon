import Widget from require 'lapis.html'
mde = require 'markdown_extra'
Notes = require 'widgets.notes'
Examples = require 'widgets.examples'
Related = require 'widgets.related'

class Object extends Widget
  content: =>
    h1 @key
    raw mde.from_string @description

    if @constructors
      h2 #@constructors == 1 and 'Constructor' or 'Constructors'
      element 'table', ->
        for constructor in *@constructors
          tr ->
            td class: 'pre', constructor
            td @data[constructor].summary

    if @sections
      for section in *@sections
        h2 section.name
        raw mde.from_string section.description if section.description

        if section.tag and @tags[section.tag] and #@tags[section.tag] > 0
          element 'table', ->
            for key in *@tags[section.tag]
              tr ->
                td class: 'pre', key
                td @data[key].summary
    else
      if @methods and #@methods > 0
        h2 'Methods'
        element 'table', ->
          for fn in *@methods
            tr ->
              td class: 'pre', fn.key
              td fn.summary

    widget Notes notes: @notes
    widget Examples examples: @examples
    widget Related related: @related
