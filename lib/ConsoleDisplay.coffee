class ConsoleDisplay
  notify: (message, observable) ->
    switch message
      when 'changed'
        console.log('---')
        console.dir(observable)

if exports?
  e = exports
else
  e = window

e.ConsoleDisplay = ConsoleDisplay
