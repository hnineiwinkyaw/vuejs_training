gulp = require 'gulp'
config = require '../config'
del = require 'del'
chalk = require 'chalk'
runSequence = require 'run-sequence'
fs = require 'fs'

gulp.task('default', ['clean'], (cb) ->
  console.log(chalk.magenta.inverse('» Building for development...'))
  # runSequence(['copy', 'pug', 'sass', 'ts', 'watch'])
  runSequence(['webpack', 'sw', 'copy', 'sass', 'pug'], 'watch')
)

gulp.task('release', ['deploy:gh-stage'], (cb) ->
  console.log(chalk.magenta.inverse('» Deployed...'))
)

gulp.task('clean', () ->
  console.log(chalk.magenta.inverse('» Deleting...'))
  del.sync([config.path.distpath, '!*.git'], {force: true}, (err, deletedFiles) ->
    if err
      console.log(chalk.red('Error deleting files: '+err))
  )
)
