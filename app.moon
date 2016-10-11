lapis = require 'lapis'

class extends lapis.Application
  @enable 'etlua'
  layout: 'layout'

  [index: "/"]: =>
    render: true
