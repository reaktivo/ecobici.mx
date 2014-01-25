express = require 'express'
http = require 'http'
{ join } = require 'path'
assets = require 'connect-assets'
load = require 'express-load'

module.exports = app = express()

app.set 'port', process.env.PORT or 3000
app.set 'views', join(__dirname, 'views')
app.set 'view engine', 'jade'
app.use express.favicon()
app.use express.logger('dev')
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()
app.use assets(pathsOnly: yes, helperContext: app.locals)
app.use app.router
app.use express.static( join(__dirname, 'public') )

if 'development' is app.get('env')
  app.use express.errorHandler()

load('locals').then('routes').into(app)
load('routes').into(app)

http.createServer(app).listen app.get('port'), ->
  console.log 'Express server listening on port ' + app.get('port')

