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
ts = require 'gulp-typescript'
changed = require 'gulp-changed'

tsProject = ts.createProject('tsconfig.json', {
  typescript: require('typescript')
})

gulp.task('ts', () ->
  console.log(chalk.magenta.inverse('» Compiling ts...'))
  return gulp.src([config.path.assetspath + '/assets/ts/**/*.ts'])
    .pipe(changed(config.path.distpath + config.path.jspath))
    .pipe(ts(tsProject))
    .pipe(gulp.dest(config.path.distpath + config.path.jspath))
    .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)

gulp.task('sw', () ->
  console.log(chalk.magenta.inverse('» Compiling sw...'))
  return gulp.src([config.path.assetspath + '/assets/ts/sw.ts'])
    .pipe(changed(config.path.distpath))
    .pipe(ts(tsProject))
    .pipe(gulp.dest(config.path.distpath))
    .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)
