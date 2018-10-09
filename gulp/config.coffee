# variables
fs = require 'fs'
config = module.exports = JSON.parse fs.readFileSync('./config.json', 'utf8')

module.exports = config
