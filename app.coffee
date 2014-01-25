express = require('express')
routes = require('./routes')
user = require('./routes/user')
http = require('http')
{ join } = require('path')
assets = require 'connect-assets'

module.exports = app = express()

app.set 'port', process.env.PORT or 3000
app.set 'views', join(__dirname, 'views')
app.set 'view engine', 'jade'
app.use express.favicon()
app.use express.logger('dev')
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()
app.use assets()
app.use app.router
app.use express.static( join(__dirname, 'public') )

if 'development' == app.get('env')
  app.use express.errorHandler()


app.get '/', routes.index
app.get '/users', user.list

http.createServer(app).listen app.get('port'), ->
  console.log 'Express server listening on port ' + app.get('port')

