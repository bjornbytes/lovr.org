config = require 'lapis.config'

config 'development', ->
  code_cache 'off'
  port 10811
  env 'dev'
  version 'master'

config 'production', ->
  code_cache 'on'
  port 10812
  env 'prod'
  version 'v0.14.0'
