versions = () ->
  t = {}
  for file in lfs.dir "content"
    isDirectory = lfs.attributes("content/#{file}", 'mode') == 'directory'
    if isDirectory and not file\match('^%.')
      t[file] = file
      table.insert t, file
  table.sort t, (a, b) ->
    if a\match('v%d') and b\match('v%d')
      ta = { a\match('(%d+)%.(%d+)%.(%d+)') }
      tb = { b\match('(%d+)%.(%d+)%.(%d+)') }
      for i = 1, 3
        if tonumber(ta[i]) < tonumber(tb[i]) then return false
        elseif tonumber(ta[i]) > tonumber(tb[i]) then return true
      false
    else
      return a < b
  t

versions
