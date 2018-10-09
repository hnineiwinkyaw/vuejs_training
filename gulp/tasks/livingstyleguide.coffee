gulp = require 'gulp'
config = require '../config'
path = require 'path'
chalk = require 'chalk'
runSequence = require 'run-sequence'
handleErrors = require '../util/handleErrors'
gulpIf = require 'gulp-if'
browserSync = require 'browser-sync'
lsg = require 'gulp-livingstyleguide'

gulp.task('lsg', () ->
  console.log(chalk.magenta.inverse('processing lsg files'))
  return gulp.src([config.path.assetspath + '/docs/index.html.lsg'])
    .pipe(lsg())
    .pipe(gulp.dest(config.path.distpath + '/docs'))
    .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)
