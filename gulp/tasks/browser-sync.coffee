gulp = require 'gulp'
browserSync = require 'browser-sync'
config = require '../config'
chalk = require 'chalk'
historyFallback = require 'connect-history-api-fallback'

connection = {}

###
 Run the build task and start a server with BrowserSync
###

gulp.task('browsersync', () ->
  # Serve files and connect browsers
  
  browserSync.init({
    server: {
      baseDir: config.path.distpath,
      directory: true,
      index: "index.html",
      host: "0.0.0.0",
      middleware: [
        historyFallback({ index: '/app.html'})
      ]
    },
    logConnections: false,
    debugInfo: false,
    open: true
  }, (err, data) ->
    if err isnt null
      console.log(
        chalk.red('✘  Setting up a local server failed... Please try again. Aborting.\n') +
        chalk.red(err)
      )
      process.exit(0)

    # Store started state globally
    connection.external = data.options.external
    connection.port = data.options.port
    config.server.lrStarted = true
  )
)
