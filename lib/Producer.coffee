if require?
  {NoiseGenerator} = require('../lib/NoiseGenerator')
  {Time} = require('../lib/Time')
  {World} = require('../lib/World')

class Producer
  constructor: ->
    @grid = (new NoiseGenerator).generate(25, 25)
    @world = new World(@grid)
    
  registerObserver: (observer) ->
    @world.registerObserver(observer)
  
  produce: (generationCount) ->
    time = new Time(@world)
    time.pass(generationCount)

root = exports ? this
root.Producer = Producer
