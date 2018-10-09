gulp = require 'gulp'
config = require '../config'
path = require 'path'
chalk = require 'chalk'
runSequence = require 'run-sequence'
handleErrors = require '../util/handleErrors'
gulpIf = require 'gulp-if'
browserSync = require 'browser-sync'
accessibility = require 'gulp-accessibility'

gulp.task('aria', () ->
  console.log(chalk.magenta.inverse('processing accessibility files'))
  return gulp.src([config.path.distpath + '/**/*.html'])
    #WCAG2A, WCAG2AA, and WCAG2AAA
    .pipe(accessibility({
        accessibilityLevel: 'WCAG2AAA'
        force: true
      }))
    .on('error', console.log)
    .pipe(accessibility.report({reportType: 'txt'}));
    # .pipe(gulp.dest('tmp/accessibility.txt'));
)
