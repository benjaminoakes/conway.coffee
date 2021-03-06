if require?
  {DeadCell, AliveCell} = require('../lib/Cell')

class World
  constructor: (grid) ->
    @observers = []

    @grid = grid.map (row) ->
      row.map (rawCell) ->
        if rawCell == 0
          new DeadCell
        else if rawCell == 1
          new AliveCell
        else
          rawCell

  inspect: ->
    lines = @grid.map (row) ->
      strings = row.map (cell) ->
        if cell.alive
          'o'
        else if cell.dead
          '_'
        else
          'x'
      strings.join('')
    lines.join('\n')
  
  equals: (other) ->
    @inspect() == other.inspect()

  countNeighbors: (x, y) ->
    sum = 0
    grid = @grid

    [-1, 0, 1].forEach (j) ->
      [-1, 0, 1].forEach (i) ->
        unless i == 0 && j == 0
          if outer = grid[y + j]
            if inner = outer[x + i]
              sum += inner.count

    sum

  next: ->
    next = @grid.map (row, y) =>
      row.map (cell, x) =>
        cell.next(@countNeighbors(x, y))

  tick: ->
    @grid = @next()
    @notifyObservers('changed')
  
  registerObserver: (observer) ->
    @observers.push(observer)

  notifyObservers: (message) ->
    @observers.forEach (observer) =>
      observer.notify(message, this)

root = exports ? this
root.World = World
