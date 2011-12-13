{exec}  = require('child_process')
rimraf  = require('rimraf')

task 'build', 'Compile CoffeeScript into a single JavaScript file', ->
  exec 'node_modules/.bin/coffee --output build --compile --join lib/*.coffee', (err, stdout, stderr) ->
    throw err if err
    console.log(stdout + stderr)

task 'clean', 'Clean generated files', ->
  rimraf.sync('build')
  # rimraf.sync('node_modules')

task 'spec', 'Run Jasmine specs in spec/', ->
	exec 'node_modules/.bin/jasmine-node --coffee spec/', (err, stdout, stderr) ->
    throw err if err
    console.log(stdout + stderr)
