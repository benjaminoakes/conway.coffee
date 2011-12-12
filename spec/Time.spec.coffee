Time = require('../lib/Time').Time

describe Time, ->
  beforeEach ->
    @subject = tick: ->
    spyOn(@subject, 'tick')
    @time = new Time(@subject)

  it 'ticks away time on its subject', ->
    @time.tick()
    expect(@subject.tick).wasCalled()
  
  it 'passes a set duration of time', ->
    @time.pass(3)
    expect(@subject.tick.callCount).toEqual(3)
