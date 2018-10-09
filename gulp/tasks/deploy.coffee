gulp = require 'gulp'
ghPages = require 'gulp-gh-pages'
runSequence = require 'run-sequence'
config = require '../config'
changed = require 'gulp-changed'
chalk = require 'chalk'

gulp.task('deploy:stage', () ->
  runSequence('otherfiles', 'js', 'imgOptimise', 'deploy:gh-stage')
)

gulp.task('deploy:gh-stage', ['build'], () ->
  console.log(chalk.magenta.inverse('» Deploying to gitlab'))
  return gulp.src(config.path.distpath+'/**/*')
    .pipe(ghPages({
      
      branch: 'release',
      cacheDir: '.release',
      message: 'distribution relase'
    }))
  console.log(chalk.pink('Deploy Successful'))
)
