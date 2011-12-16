class CanvasDisplay
  # # @example new CanvasDisplay(document.getElementById('canvas').getContext('2d'))
  # constructor: (context) ->
  #   @context = context
  #   context.fillStyle = 'rgba(0,0,0,1)'
  #
  # drawPoint: (x, y) ->
  #   @context.fillRect(x, y, 1, 1)
  #
  # notify: (message, observable) ->
  #   dup = new World(observable.grid)
  #
  #   draw = =>
  #     @context.clearRect(0,0,200,200)
  #     dup.grid.forEach (row, y) ->
  #       row.forEach (cell, x) ->
  #         if cell.alive
  #           drawPoint(x, y)
  #
  #   setTimeout(draw, 10)
