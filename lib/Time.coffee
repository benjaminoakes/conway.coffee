class Time
  constructor: (@subject) ->

  tick: ->
    @subject.tick()

  pass: (duration) ->
    for i in [1..duration]
      @tick()

exports.Time = Time
