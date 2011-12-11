ns = require('../lib/Cell')
DeadCell = ns.DeadCell
AliveCell = ns.AliveCell

describe DeadCell, ->
  beforeEach ->
    @cell = new DeadCell

  describe 'with 3 neighbors', ->
    it 'becomes alive', ->
      expect(@cell.tick(3).alive).toBeTruthy()

  describe 'without 3 neighbors', ->
    it 'dies', ->
      expect(@cell.tick(0).dead).toBeTruthy()

describe AliveCell, ->
  beforeEach ->
    @cell = new AliveCell

  describe 'with fewer than 2 neighbors', ->
    it 'dies', ->
      expect(@cell.tick(1).dead).toBeTruthy()

  describe 'with 2 neighbors', ->
    it 'lives on', ->
      expect(@cell.tick(2).alive).toBeTruthy()

  describe 'with 3 neighbors', ->
    it 'lives on', ->
      expect(@cell.tick(3).alive).toBeTruthy()

  describe 'with more than 3 neighbors', ->
    it 'dies', ->
      expect(@cell.tick(4).dead).toBeTruthy()
