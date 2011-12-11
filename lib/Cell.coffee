class DeadCell
  alive: false
  dead: true

  tick: (neighborCount) ->
    if neighborCount == 3
      new AliveCell
    else
      new DeadCell

class AliveCell
  alive: true
  dead: false

  tick: (neighborCount) ->
    if neighborCount < 2 || neighborCount > 3
      new DeadCell
    else
      new AliveCell

exports.DeadCell = DeadCell
exports.AliveCell = AliveCell
