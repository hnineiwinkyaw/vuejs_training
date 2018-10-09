gulp = require 'gulp'
config = require '../config'
plumber = require 'gulp-plumber'
chalk = require 'chalk'
del = require 'del'
handleErrors = require '../util/handleErrors'

gulp.task('del', () ->
  # del([config.destPath+'/**/*', '!*.git'],{force: true} , function (err, deletedFiles) {
  del.sync([config.path.stagepath+'/**/*', '!*.git'], {force: true}, (err, deletedFiles) ->
    if err
      console.log(chalk.red('Error deleting files: '+err))
  )
)

gulp.task('otherfiles', ['del'], () ->
  console.log(chalk.blue('» copying other assets files...'))
  return gulp.src([config.path.servepath + '/**/*', '!'+config.path.servepath + '/**/*.DS_Store'])
    .pipe(plumber())
    .on('error', handleErrors)
    .pipe(gulp.dest(config.path.stagepath)) # output directory
)
