class ConsoleDisplay
  notify: (message, observable) ->
    switch message
      when 'changed'
        console.log('---')
        console.dir(observable)

root = exports ? this
root.ConsoleDisplay = ConsoleDisplay
