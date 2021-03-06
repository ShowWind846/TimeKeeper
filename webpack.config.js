const glob = require("glob");
const path = require("path");
const webpack = require('webpack');
const { WebpackManifestPlugin } = require("webpack-manifest-plugin");

module.exports = {
  mode: "development",
  entry: "./frontend/src/index.js",
  output: {
    // path: path.resolve(__dirname, 'dist'),
    path: path.resolve(__dirname, './public/packs'),
    // filename: 'main.js'
    filename: 'main-[contenthash].js'
  },
  module: {
    rules: [
      {
        test: /\.s[ac]ss$/i,
        use: [
          "style-loader",
          "css-loader",
          "sass-loader"
        ]
      }
    ]
  },
  plugins: [
    new WebpackManifestPlugin({
      publicPath: '/packs/'
    }),
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
      jquery: 'jquery',
      "window.jQuery": 'jquery'
    })
  ],
  devServer: {
    contentBase: path.join(__dirname, 'frontend'),
    port: 8080,
    open: true,
  }
};