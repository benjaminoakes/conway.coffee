{exec} = require('child_process')

task 'build', 'Compile CoffeeScript into a single JavaScript file', ->
	exec 'node_modules/.bin/coffee --output build --compile --join lib/*.coffee', (err, stdout, stderr) ->
    throw err if err
    console.log(stdout + stderr)

task 'spec', 'Run Jasmine specs in spec/', ->
	exec 'node_modules/.bin/jasmine-node --coffee spec/', (err, stdout, stderr) ->
    throw err if err
    console.log(stdout + stderr)
