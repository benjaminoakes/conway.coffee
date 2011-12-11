_ = require('underscore')

cell = require('../lib/Cell')
DeadCell = cell.DeadCell
AliveCell = cell.AliveCell

class World
  constructor: (grid) ->
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
          sum += grid[y + j][x + i].count

    sum

  tick: ->
    next = @grid.map (row) ->
      row.map (cell) ->
        cell.tick(0)

    new World(next)

exports.World = World
