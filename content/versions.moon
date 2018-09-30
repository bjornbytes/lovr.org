versions = () ->
  t = {}
  for file in lfs.dir "content"
    if not file\match('^%.') and lfs.attributes("content/#{file}", 'mode') == 'directory'
      t[file] = file
      table.insert t, file
  table.sort t, (a, b) ->
    if a == 'master' or b == 'master'
      a < b
    else
      ta = { a\match('(%d+)%.(%d+)%.(%d+)') }
      tb = { b\match('(%d+)%.(%d+)%.(%d+)') }
      for i = 1, 3
        if tonumber(ta[i]) < tonumber(tb[i]) then return false
        elseif tonumber(ta[i]) > tonumber(tb[i]) then return true
      false
  t

versions
