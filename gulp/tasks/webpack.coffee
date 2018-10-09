gulp = require 'gulp'
config = require '../config'
path = require 'path'
chalk = require 'chalk'
runSequence = require 'run-sequence'
handleErrors = require '../util/handleErrors'
gulpIf = require 'gulp-if'
minify = require 'gulp-minify'
rename = require 'rename'
uglify = require 'gulp-uglify'
browserSync = require 'browser-sync'
changed = require 'gulp-changed'
webpack = require 'webpack-stream'
webpack2 = require 'webpack'
fs = require 'fs'

gulp.task('webpack', () ->
  console.log(chalk.magenta.inverse('» Compiling webpack...'))
  return gulp.src([config.path.assetspath + '/assets/js/app.js'])
    # .pipe(webpack(JSON.parse fs.readFileSync('./webpack.config.json', 'utf8')))
    .pipe(webpack(require('../../webpack.config.js')), webpack2)
    .on('error', handleErrors)
    .pipe(gulp.dest(config.path.distpath + config.path.jspath))
    .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)
