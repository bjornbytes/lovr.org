var path = require('path');

module.exports = {
  context: path.resolve(__dirname, 'static/js'),
  entry: './main.js',
  output: {
    filename: 'static/js/lovr.js'
  },
  module: {
    rules: [{
      test: /highlight/,
      loader: 'script-loader'
    }]
  }
};
