{exec}  = require('child_process')
rmrf  = require('rimraf')

task 'build', 'Compile CoffeeScript into a single JavaScript file', ->
  exec 'node_modules/.bin/coffee --output public/build --compile --join conway.js lib/*.coffee', (err, stdout, stderr) ->
    throw err if err
    console.log(stdout + stderr)

task 'clean', 'Clean generated files', ->
  rmrf.sync('build')
  # rmrf.sync('node_modules')

task 'spec', 'Run Jasmine specs in spec/', ->
	exec 'node_modules/.bin/jasmine-node --coffee spec/', (err, stdout, stderr) ->
    throw err if err
    console.log(stdout + stderr)
