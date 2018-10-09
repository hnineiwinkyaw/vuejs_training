gulp = require 'gulp'
config = require '../config'
path = require 'path'
chalk = require 'chalk'
handleErrors = require '../util/handleErrors'
gulpIf = require 'gulp-if'
browserSync = require 'browser-sync'
sass = require 'gulp-sass'
concat = require 'gulp-concat'
autoprefixer = require 'autoprefixer'
postcss = require 'gulp-postcss'
gradientfixer = require 'postcss-gradientfixer'
promise = require 'gulp-promise'
changed = require 'gulp-changed'
sassVars = require 'gulp-sass-variables'
uncss = require 'gulp-uncss'
fs = require 'fs'
runSequence = require 'run-sequence'

htmlFiles = [];

gulp.task('sass-pug', ['pug'], () ->
  htmlFiles = fs.readdirSync(config.path.distpath + '/pp').map((htmlFile) ->
    "#{__dirname}/../../dist/pp/#{htmlFile}";
  );
  runSequence('sass');
)

gulp.task('sass', () ->
  console.log(chalk.magenta.inverse('processing sass files'))
  processors = [
    autoprefixer({browsers: ['last 1 version']}),
    gradientfixer
  ];

  p = new promise()

  plist = [
    gulp.src([config.path.assetspath + '/assets/sass/project-bootstrap.scss', config.path.assetspath + '/node_modules/flexboxgrid/dist/flexboxgrid.min.css'])
      .pipe(changed(config.path.distpath + config.path.csspath))
      .pipe(sassVars({
        '$theme-color': '#b18d13'
      }))
      .pipe(sass.sync({ includePaths: [config.path.libspath + '/bootstrap-sass/assets/stylesheets'] }).on('error', handleErrors))
      .pipe(postcss(processors))
      .pipe(concat('framework.css'))
      .pipe(gulpIf(htmlFiles.length > 0, uncss({ html: htmlFiles })))
      .pipe(gulp.dest(config.path.distpath + config.path.csspath))
      .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})))
    # gulp.src([config.path.assetspath + '/assets/sass/project-bootstrap.docs.scss', config.path.assetspath + '/node_modules/flexboxgrid/dist/flexboxgrid.min.css'])
    #   .pipe(changed(config.path.distpath + config.path.csspath))
    #   .pipe(sassVars({
    #     '$theme-color': '#fff'
    #   }))
    #   .pipe(sass.sync({ includePaths: [config.path.libspath + '/bootstrap-sass/assets/stylesheets'] }).on('error', handleErrors))
    #   .pipe(postcss(processors))
    #   .pipe(concat('framework-docs.css'))
    #   .pipe(gulp.dest(config.path.distpath + config.path.csspath))
    #   .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})))
    ]

  buildPromiseList = (theme) ->
    plist.push(gulp.src([config.path.assetspath + '/assets/sass/project-bootstrap.scss', config.path.assetspath + '/node_modules/flexboxgrid/dist/flexboxgrid.min.css'])
      .pipe(changed(config.path.distpath + config.path.csspath))
      .pipe(sassVars({
        '$theme-color': "##{theme}"
      }))
      .pipe(sass.sync({ includePaths: [config.path.libspath + '/bootstrap-sass/assets/stylesheets'] }).on('error', handleErrors))
      .pipe(postcss(processors))
      .pipe(concat("framework-#{theme}.css"))
      .pipe(gulpIf(htmlFiles.length > 0, uncss({ html: htmlFiles })))
      .pipe(gulp.dest(config.path.distpath + config.path.csspath))
      .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true}))))

  # buildPromiseList theme for theme in config.themes

  p.makePromises plist
)
