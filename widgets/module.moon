import Widget from require 'lapis.html'
mde = require 'markdown_extra'
Examples = require 'widgets.examples'

class Module extends Widget
  content: =>
    h1 @key
    raw mde.from_string @description

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
      if @functions and #@functions > 0
        h2 'Functions'
        element 'table', ->
          for fn in *@functions
            tr ->
              td class: 'pre', fn.key
              td fn.summary

    if @notes
      h2 'Notes'
      raw mde.from_string @notes

    widget Examples examples: @examples
