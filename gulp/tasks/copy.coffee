gulp = require 'gulp'
config = require '../config'
chalk = require 'chalk'
fs = require 'fs'
ts = require 'gulp-typescript'

tsProject = ts.createProject('tsconfig.json', {
  typescript: require('typescript')
})

gulp.task('copy', ['copy-upup', 'copy-swtoolbox', 'copy-manifest', 'copy-dummydata', 'copy-fonts', 'copy-mm-fonts', 'copy-images', 'copy-nodemodule', 'compile-specs'])

gulp.task('copy-upup', () ->
  console.log(chalk.magenta.inverse('Copying upup sw'));
  gulp.src([config.path.assetspath + '/node_modules/upup/dist/upup.sw.min.js'])
    .pipe(gulp.dest(config.path.distpath))
)

gulp.task('copy-swtoolbox', () ->
  console.log(chalk.magenta.inverse('Copying swtoolbox'));
  gulp.src([config.path.assetspath + '/node_modules/sw-toolbox/sw-toolbox.js', config.path.assetspath + '/node_modules/sw-toolbox/companion.js'])
    .pipe(gulp.dest(config.path.distpath + config.path.jspath))
)

gulp.task('copy-manifest', () ->
  console.log(chalk.magenta.inverse('Copying manifest files'));
  gulp.src([config.path.assetspath + '/assets/manifest-*.json'])
    .pipe(gulp.dest(config.path.distpath + config.path.manifestpath))
)

gulp.task('copy-dummydata', () ->
  console.log(chalk.magenta.inverse('Copying dummy data'));
  gulp.src([config.path.assetspath + '/dummy-data/**/*.*'])
    .pipe(gulp.dest(config.path.distpath + '/dummy-data/'))
)

gulp.task('copy-images', () ->
  console.log(chalk.magenta.inverse('Copying images'));
  gulp.src([config.path.assetspath + '/assets/images/**/*.*'])
    .pipe(gulp.dest(config.path.distpath + config.path.copypath + 'images'))
)

gulp.task('copy-videos', () ->
  console.log(chalk.magenta.inverse('Copying videos'));
  gulp.src([config.path.assetspath + '/assets/videos/**/*.*'])
    .pipe(gulp.dest(config.path.distpath + config.path.copypath + 'videos'))
)

gulp.task('copy-fonts', () ->
  console.log(chalk.magenta.inverse('Copying fonts'));
  gulp.src([config.path.libspath + '/font-awesome/fonts/**/*-webfont.*'])
    .pipe(gulp.dest(config.path.distpath + '/fonts'))
)

gulp.task('copy-mm-fonts', () ->
  console.log(chalk.magenta.inverse('Copying MM Fonts'));
  gulp.src([config.path.assetspath + '/assets/fonts/*.*'])
    .pipe(gulp.dest(config.path.distpath + '/fonts'))
)

gulp.task('copy-nodemodule', () ->
  console.log(chalk.magenta.inverse('Copying node module'));
  gulp.src([config.path.assetspath + '/node_modules/zone.js/dist/zone.min.js'])
    .pipe(gulp.dest(config.path.distpath + config.path.jspath + '/vendors'))
)

gulp.task('compile-specs', ['copy-specs'], () ->
  gulp.src([config.path.assetspath + '/spec/**/*.ts'])
    .pipe(ts(tsProject))
    .pipe(gulp.dest(config.path.distpath + '/spec'));
)
gulp.task('copy-specs', () ->
  console.log(chalk.magenta.inverse('Copying specs'));

  gulp.src([config.path.assetspath + '/spec/**/*.*', '!' + config.path.assetspath + '/spec/**/*.ts', config.path.assetspath + '/node_modules/jasmine-core/lib/**/*.*'])
    .pipe(gulp.dest(config.path.distpath + '/spec'))
)
