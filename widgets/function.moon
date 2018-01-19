import Widget from require 'lapis.html'
mde = require 'markdown_extra'
Related = require 'widgets.related'
Examples = require 'widgets.examples'
Notes = require 'widgets.notes'

class Function extends Widget
  content: =>
    h1 @key
    raw mde.from_string @description

    for i, variant in ipairs(@variants)
      raw mde.from_string variant.description if variant.description

      pre ->
        code ->
          returns = table.concat([ ret.name for ret in *variant.returns ], ', ')

          arguments = '(' .. table.concat([ arg.name for arg in *variant.arguments ], ', ') .. ')'

          if @tag == 'callbacks'
            raw 'function ' .. @key .. arguments .. '\n  -- your code here\nend'
          else
            returns ..= ' = ' if #returns > 0
            raw returns .. @key .. arguments

      h3 'Arguments'

      if #variant.arguments > 0
        element 'table', class: 'signature', ->
          thead ->
            tr ->
              td 'Name'
              td 'Type'
              td 'Default'
              td 'Description'
          tbody ->
            for arg in *variant.arguments
              tr ->
                td class: 'pre', arg.name
                td class: 'pre', arg.type
                td class: 'pre', arg.default
                td arg.description
      else
        p class: 'muted', 'None'

      h3 'Returns'

      if #variant.returns > 0
        element 'table', class: 'signature', ->
          thead ->
            tr ->
              td 'Name'
              td 'Type'
              td 'Description'
          tbody ->
            for ret in *variant.returns
              tr ->
                td class: 'pre', ret.name
                td class: 'pre', ret.type
                td ret.description
      else
        p class: 'muted', 'Nothing'

      hr! if i ~= #@variants

    widget Notes notes: @notes
    widget Examples examples: @examples
    widget Related related: @related

