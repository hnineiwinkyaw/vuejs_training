gulp = require 'gulp'
config = require '../config'
path = require 'path'
chalk = require 'chalk'
runSequence = require 'run-sequence'
handleErrors = require '../util/handleErrors'
gulpIf = require 'gulp-if'
browserSync = require 'browser-sync'
pug = require 'gulp-pug'
extend = require 'extend'
dummyData = extend(require '../../dummy-data/data.json')
changed = require 'gulp-changed'

gulp.task('pug', () ->
  dummyData.PUG_PR = false;
  console.log(chalk.magenta.inverse('processing pug files'))
  return gulp.src([config.path.assetspath + '/html/templates/*.pug'])
    .pipe(changed(config.path.distpath))
    .pipe(pug({
      pretty: true,
      data: dummyData,
      locals: dummyData
    }))
    .on('error', handleErrors)
    .pipe(gulp.dest(config.path.distpath))
    .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)
