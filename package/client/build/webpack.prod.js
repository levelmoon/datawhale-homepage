const { merge } = require('webpack-merge')
const base = require('./webpack.base.js')
const path = require('path')

module.exports = merge(base, {
  mode: 'production',
  output: {
    filename: 'js/[name].[contenthash].js',
    path: path.resolve(__dirname, '../../../output/client'),
  },
})
