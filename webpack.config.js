var path = require('path');

module.exports = [
  {
    context: path.resolve(__dirname, 'static/js'),
    entry: './src/docs.js',
    output: {
      filename: 'static/js/docs.js'
    },
    module: {
      rules: [{
        test: /highlight/,
        loader: 'script-loader'
      }]
    }
  },
  {
    context: path.resolve(__dirname, 'static/js'),
    entry: './src/share.js',
    output: {
      filename: 'static/js/share.js'
    }
  },
  {
    context: path.resolve(__dirname, 'static/js'),
    entry: './src/play.js',
    output: {
      filename: 'static/js/play.js'
    }
  }
];
