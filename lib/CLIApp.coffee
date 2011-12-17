if require?
  _ = require('underscore')
  {ConsoleDisplay} = require('../lib/ConsoleDisplay')
  {Producer} = require('../lib/Producer')

class CLIApp
  defaultCount: 100

  constructor: (args) ->
    @args = args
    @progname = @args[1]
    @processArgs()

    @producer = new Producer
    @producer.registerObserver(new ConsoleDisplay)

  showUsage: ->
    console.log("""
      Usage: #{@progname} [--help] [generationCount]

      Simple implementation of Conway's Game of Life

        --help              Show this help text.
        generationCount     Run for this many generations (e.g., 1, 10, 100, etc)
                            Default: #{@defaultCount}
    """)
    process.exit(-1)

  processArgs: ->
    if _.include(@args, '--help')
      @showUsage()
    else
      @generationCount = Number(@args[2]) || @defaultCount

  start: ->
    @producer.produce(@generationCount)

root = exports ? this
root.CLIApp = CLIApp
