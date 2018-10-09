#-- Plugins requires

gulp = require 'gulp'
gutil = require 'gulp-util'
config = require '../config'
browserSync = require 'browser-sync'
runSequence = require 'run-sequence'

###
 * Start browsersync task and then watch files for changes
###

changeEvent = (evt) ->
  gutil.log('File', gutil.colors.cyan(evt.path.replace(new RegExp('/.*(?=/' + config.path.assetspath + ')/'), '')), 'was', gutil.colors.magenta(evt.type))

gulp.task('browser-refresh', () ->
  browserSync.reload()
)

gulp.task('watch', ['browsersync'], () ->
  gulp.watch([config.path.assetspath + '/assets/img/**/*']).on('change', (evt) ->
    changeEvent(evt)
    # browserSync.reload()
  )

  gulp.watch([config.path.assetspath + '/assets/js/**/*']).on('change', (evt) ->
    changeEvent(evt)
    runSequence('webpack')
    # browserSync.reload()
  )

  gulp.watch([config.path.assetspath + '/html/**/*.pug', '!'+ config.path.assetspath + '/html/**/*-vue.pug']).on('change', (evt) ->
    changeEvent(evt)
    runSequence('pug')
    # browserSync.reload()
  )

  gulp.watch([config.path.assetspath + '/html/**/*.vue']).on('change', (evt) ->
    changeEvent(evt)
    runSequence('webpack')
    # browserSync.reload()
  )

  gulp.watch([config.path.assetspath + '/assets/sass/**/*.scss', config.path.assetspath + '/assets/sass/**/*.sass']).on('change', (evt) ->
    changeEvent(evt)
    runSequence('sass')
    # browserSync.reload()
  )

  # gulp.watch([config.path.assetspath + '/assets/ts/**/*.ts']).on('change', (evt) ->
  #   changeEvent(evt)
  #   runSequence('webpack')
  #   # browserSync.reload()
  # )

  # gulp.watch([config.path.assetspath + '/assets/ts/sw.ts']).on('change', (evt) ->
  #   changeEvent(evt)
  #   runSequence('sw')
  #   # browserSync.reload()
  # )

  gulp.watch([config.path.assetspath + '/spec/**/*.ts']).on('change', (evt) ->
    changeEvent(evt)
    runSequence('compile-specs')
    # browserSync.reload()
  )

  gulp.watch([config.path.assetspath + '/spec/unit/**/*.*']).on('change', (evt) ->
    changeEvent(evt)
    runSequence('copy-specs')
    # browserSync.reload()
  )
)
