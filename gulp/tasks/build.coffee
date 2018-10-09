gulp = require 'gulp'
config = require '../config'
del = require 'del'
chalk = require 'chalk'
runSequence = require 'run-sequence'
fs = require 'fs'
uglify = require 'gulp-uglify'
rename = require 'gulp-rename'
cleanCss = require 'gulp-clean-css'

gulp.task('minify', ['minify-js', 'minify-css'], (cb) ->
  console.log(chalk.magenta.inverse('» Uglifying...'))
  if cb then cb()
)

gulp.task('minify-js', (cb) ->
  console.log(chalk.magenta.inverse('» Uglifying JS...'))
  return gulp.src([config.path.distpath+'/js/**/*.js', '!'+config.path.distpath+'/js/**/*.min.js'])
    .pipe(uglify())
    .pipe(rename (path) -> path.extname = '.min.js')
    .pipe(gulp.dest(config.path.distpath + config.path.jspath))
)

gulp.task('minify-css', (cb) ->
  console.log(chalk.magenta.inverse('» Uglifying CSSS...'))
  return gulp.src([config.path.distpath+'/css/**/*.css', '!'+config.path.distpath+'/css/**/*.min.css'])
    .pipe(cleanCss({
      processImport: false
      }))
    .pipe(rename (path) -> path.extname = '.css')
    .pipe(gulp.dest(config.path.distpath + config.path.csspath))
)

gulp.task('build', ['clean'], (cb) ->
  console.log(chalk.magenta.inverse('» Building...'))
  runSequence(['webpack', 'sw', 'copy', 'sass', 'pug'], 'minify', cb)
)
