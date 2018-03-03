lfs = require 'lfs'
zip = require 'brimworks.zip'

math.randomseed os.time!
import random from math

upload = (content) ->
  uuid = ->
    randomCharacter = ->
      switch random 1, 2
        when 1 random 97, 122
        when 2 random 48, 57

    string.char unpack [ randomCharacter! for i = 1, 6 ]

  id = uuid!
  while lfs.attributes("static/play/#{id}.js", 'mode')
    id = uuid!

  zipName = os.tmpname!
  file = io.open(zipName, 'wb')
  file\write(content)
  file\close!

  archive = zip.open(zipName)

  if not archive
    return error 'unzip'

  if #archive > 1000
    return error 'too many files'

  if not archive\name_locate('main.lua')
    return error 'no main'

  unzipTo = "/tmp/#{id}"
  lfs.mkdir(unzipTo)

  totalSize = 0
  for i = 1, #archive
    stat = archive\stat(i)
    if not stat
      return error 'unzip'

    if stat.name\match('^/')
      return error 'absolute'

    totalSize += stat.size

    if totalSize > 25e6
      return error 'too big'

    if stat.name\match('/$') and stat.size == 0
      if not lfs.mkdir("#{unzipTo}/#{stat.name}")
        return error 'unzip'
    else
      handle = archive\open(i)
      data = handle\read(stat.size)
      handle\close!

      file = io.open("#{unzipTo}/#{stat.name}", 'wb')
      file\write(data)
      file\close!

  os.execute("python emscripten/tools/file_packager.py static/play/#{id}.data --no-heap-copy --preload #{unzipTo}@/ --js-output=static/play/#{id}.js")
  os.remove(zipName)

  id

upload
