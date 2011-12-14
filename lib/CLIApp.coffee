{Time} = require('../lib/Time')
{World} = require('../lib/World')
{NoiseGenerator} = require('../lib/NoiseGenerator')
{ConsoleDisplay} = require('../lib/ConsoleDisplay')

class CLIApp
  defaultCount: 100

  constructor: (args) ->
    @args = args
    @progname = @args[1]

  start: ->
    @processArgs()
    @bigBang()

  showUsage: ->
    console.log("""
      Usage: #{@progname} [--help] [generationCount]

      Simple implementation of Conway's Game of Life

        --help              Show this help text.
        generationCount     Run for this many generations (e.g., 1, 10, 100, etc)
    """)
    process.exit(-1)

  processArgs: ->
    if @args.some((s) -> '--help' == s)
      @showUsage()
    else
      @generationCount = parseInt(@args[2]) || @defaultCount

  bigBang: ->
    grid = (new NoiseGenerator).generate(25, 25)
    world = new World(grid)
    world.registerObserver(new ConsoleDisplay)
    
    time = new Time(world)
    time.pass(@generationCount)

root = exports ? this
root.CLIApp = CLIApp
