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
  }
];
