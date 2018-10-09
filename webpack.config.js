var path = require('path');
var webpack2 = require('webpack');
var extend = require('extend');
var dummyData = extend(require('./dummy-data/data.json'))

module.exports = {
  "entry": {
    "framework": ["jquery", "bootstrap", "svgxuse"],
    "app": "./assets/js/app.js"
  },
  "output": {
    "path": path.join(__dirname, "js"),
    "filename": "[name].bundle.js",
    "chunkFilename": "[id].chunk.js"
  },
  "module": {
    "loaders": [
      {
        "test": /\.js$/,
        "loader": "babel-loader",
        exclude: /node_modules/
      },
      {
        "test": /\.css$/,
        "loader": "css-loader"
      },
      {
        "test": /\.vue$/,
        "loader": "vue-loader",
        "options": {

          baseUrl: '/dasda'
        }
      },
      {
        "test": /\.(woff2?|eot|ttf|otf)(\?.*)?$/,
        "loader": 'file-loader',
        "options": {
          limit: 10000,
          name: '[name].[ext]?[hash]'
          // name: utils.assetsPath('fonts/[name].[hash:7].[ext]'),
          // publicPath: process.env.NODE_ENV === 'production' ? '../../' : '/'
        }
      },
      {
        "test": require.resolve("jquery"),
        "loader": "expose?$!expose?jQuery"
      }
    ]
  },
  vue: {
    esModule: false,
    template: dummyData
  },
  plugins: [
    new webpack2.optimize.CommonsChunkPlugin({ name: "framework", filename: "framework.bundle.js", children: true, minChunks: Infinity }),
    // new webpack2.optimize.UglifyJsPlugin({ compress: { warnings: false }}),
    new webpack2.ProvidePlugin({
      $: "jquery",
      jQuery: "jquery",
      jquery: "jquery"
    })
  ],
  resolve: {
    // modulesDirectories: [ 'node_modules', 'assets/ts', "html" ],
    extensions: [ '', '.js', '.pug', '.vue' ],
    alias: {
      vue$: 'vue/dist/vue.common.js',
      'bootstrap-typeahead': 'typeahead.js/dist/typeahead.jquery.min.js',
      'bloodhound': 'typeahead.js/dist/bloodhound.min.js'
    }
  }
}
