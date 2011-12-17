if require?
  {ConsoleDisplay} = require('../lib/ConsoleDisplay')
  {Producer} = require('../lib/Producer')

class CLIApp
  defaultCount: 100

  constructor: (args) ->
    @args = args
    @progname = @args[1]
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
    if @args.some((s) -> '--help' == s)
      @showUsage()
    else
      @generationCount = parseInt(@args[2]) || @defaultCount

  start: ->
    @processArgs()
    @producer.produce(@generationCount)

root = exports ? this
root.CLIApp = CLIApp
