class Time
  constructor: (@subject) ->

  tick: ->
    @subject.tick()

  pass: (duration) ->
    for i in [1..duration]
      @tick()

if exports?
  e = exports
else
  e = window

e.Time = Time
