import Widget from require 'lapis.html'
mde = require 'markdown_extra'
Related = require 'widgets.related'
Examples = require 'widgets.examples'
Notes = require 'widgets.notes'

class Function extends Widget
  renderSubTable: (t, hasDefault, level = 0) =>
    return if not t

    prefix = level > 0 and '.' or ''

    for field in *t
      tr class: "indent-#{level}", ->
        td class: 'pre', prefix .. field.name
        td class: { 'pre', field.type }, field.type
        td class: 'pre', field.default if hasDefault
        td -> raw (field.description and (mde.from_string field.description)\gsub('</?p>', '') or '')

        @renderSubTable field.table, hasDefault, level + 1

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
        isTableWithDefault = (arg) ->
          arg.table and #[field for field in *arg.table when field.default] > 0

        hasDefault = #[arg for arg in *variant.arguments when arg.default or isTableWithDefault(arg)] > 0

        element 'table', class: 'signature', ->
          thead ->
            tr ->
              td 'Name'
              td 'Type'
              td 'Default' if hasDefault
              td 'Description'
          tbody ->
            @renderSubTable variant.arguments, hasDefault
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
            @renderSubTable variant.returns, false
      else
        p class: 'muted', 'Nothing'

      hr! if i ~= #@variants

    widget Notes notes: @notes
    widget Examples examples: @examples
    widget Related related: @related

