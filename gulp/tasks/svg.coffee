gulp = require 'gulp'
config = require '../config'
path = require 'path'
chalk = require 'chalk'
runSequence = require 'run-sequence'
handleErrors = require '../util/handleErrors'
gulpIf = require 'gulp-if'
browserSync = require 'browser-sync'
svgstore = require 'gulp-svgstore'
svgmin = require 'gulp-svgmin'
rename = require 'gulp-rename'
xmlEdit = require 'gulp-edit-xml'

gulp.task('svg', () ->
  console.log(chalk.magenta.inverse('processing svg files'))
  return gulp.src(['/Users/zkyaw/Desktop/icons/*.svg'])
    .pipe(xmlEdit (xml) ->
      if (xml && xml.svg && xml.svg.g && xml.svg.g.length > 0)
        recursiveG = (g) ->
          if (g && typeof g != 'undefined' && g[0] && typeof g[0] != 'undefined' && g[0].$ && typeof g[0].$ != 'undefined') #&& g[0].$.stroke == 'none'
            g[0].$.stroke = '';
          if (g && typeof g != 'undefined' && g[0] && typeof g[0] != 'undefined' && g[0].$ && typeof g[0].$ != 'undefined') #&& g[0].$.fill == 'none'
            g[0].$.fill = '';

          if (g && typeof g != 'undefined' && g[0] && typeof g[0] != 'undefined' && g[0].g && typeof g[0].g != 'undefined')
            recursiveG(g[0].g);

        if (xml.svg.g && xml.svg.g[0])
          recursiveG(xml.svg.g);

      return xml;
    )
    .pipe(svgmin((file) ->
      prefix = path.basename(file.relative, path.extname(file.relative));
      return {
        plugins: [{
          cleanupIDs: {
            minify: true
          }
        }]
      }
    ))
    .pipe(svgstore())
    .pipe(rename((file) ->
      file.basename = 'symbol-defs'
    ))
    .on('error', handleErrors)
    .pipe(gulp.dest(config.path.assetspath + '/assets/images/static/icons/')) # output directory
    .pipe(gulp.dest(config.path.distpath + config.path.copypath + 'images/static/icons/')) # output directory
    .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)
