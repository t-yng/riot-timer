module.exports = {
  entry: './js/main.js',
  output: {
    path: 'dist',
    filename: 'bundle.js'
  },
  module: {
    loaders: [
      { test: /\.js$|\.tag$/, exclude: /node_modules/, loader: 'babel-loader' },
      { test: /\.tag$/, exclude: /node_modules/, loader: 'tag-loader' }
    ]
  }
}
