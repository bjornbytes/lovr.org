config = require 'lapis.config'

config 'development', ->
  port 10811
  env 'dev'

config 'production', ->
  port 10812
  env 'prod'
