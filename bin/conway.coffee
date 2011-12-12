Time = require('../lib/Time').Time
World = require('../lib/World').World
NoiseGenerator = require('../lib/NoiseGenerator').NoiseGenerator
ConsoleDisplay = require('../lib/ConsoleDisplay').ConsoleDisplay

grid = (new NoiseGenerator).generate(25, 25)
world = new World(grid)
world.registerObserver(new ConsoleDisplay)

time = new Time(world)
time.pass(100)
