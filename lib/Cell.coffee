class DeadCell
  count: 0

  alive: false
  dead: true

  next: (neighborCount) ->
    if neighborCount == 3
      new AliveCell
    else
      this

class AliveCell
  count: 1

  alive: true
  dead: false

  next: (neighborCount) ->
    if neighborCount < 2 || neighborCount > 3
      new DeadCell
    else
      this

root = exports ? this
root.DeadCell = DeadCell
root.AliveCell = AliveCell
