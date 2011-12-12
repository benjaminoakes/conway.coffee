class ConsoleDisplay
  notify: (message, observable) ->
    switch message
      when 'changed'
        console.log('---')
        console.dir(observable)

exports.ConsoleDisplay = ConsoleDisplay
