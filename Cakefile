{ exec } = require 'child_process'
{ eachSeries } = require 'async'

task 'deploy', 'Deploy app to ecobici.mx', ->

  commands = [
    'git push'
    'ssh drop "cd ~/ecobici.mx && git pull && npm install && forever restartall"'
  ]

  fn = (command, callback) ->
    exec command, (err, stdout, stderr) ->
      console.log(err) if err
      console.log('he')
      console.log stdout
      do callback

  eachSeries commands, fn
