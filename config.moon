config = require 'lapis.config'

config 'development', ->
  port 10811
  prefix '/lovr-dev'

config 'production', ->
  port 10812
  prefix '/lovr'
