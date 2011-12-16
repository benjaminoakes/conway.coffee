class ConwayWorker
  start: ->
    grid = (new NoiseGenerator).generate(100, 100)
    world = new World(grid)
    world.registerObserver(new WebWorkerObserver)
    
    time = new Time(world)
    time.pass(1000)

root = exports ? this
root.ConwayWorker = ConwayWorker
