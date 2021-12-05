const { merge } = require('webpack-merge')
const base = require('./webpack.base.js')
const path = require('path')

module.exports = merge(base, {
  mode: 'development',
  devtool: 'inline-source-map',
  cache: {
    type: 'filesystem',
  },
  output: {
    filename: 'js/[name].[hash].js',
    path: path.resolve(__dirname, '../../../output/client'),
  },
  devServer: {
    port: 8080,
    compress: true,
  },
})
