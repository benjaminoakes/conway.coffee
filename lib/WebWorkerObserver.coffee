class WebWorkerObserver
  notify: (message, observable) ->
    ps = []

    observable.grid.forEach (row, y) ->
    	row.forEach (cell, x) ->
    		if cell.alive
          ps.push([x, y])

    postMessage(message: 'clear')
    postMessage(message: 'points', coords: JSON.stringify(ps))

root = exports ? this
root.WebWorkerObserver = WebWorkerObserver
