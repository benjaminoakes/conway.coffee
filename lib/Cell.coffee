class DeadCell
  count: 0

  alive: false
  dead: true

  next: (neighborCount) ->
    if neighborCount == 3
      new AliveCell
    else
      new DeadCell

class AliveCell
  count: 1

  alive: true
  dead: false

  next: (neighborCount) ->
    if neighborCount < 2 || neighborCount > 3
      new DeadCell
    else
      new AliveCell

if exports?
  e = exports
else
  e = window

e.DeadCell = DeadCell
e.AliveCell = AliveCell
