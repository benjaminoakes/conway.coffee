World = require('../lib/World').World

describe World, ->
  describe 'inspecting', ->
    it 'gives a string representation of a 1x1 alive world', ->
      world = new World([[1]])
      expect(world.inspect()).toEqual('o')

    it 'gives a string representation of a 1x1 dead world', ->
      world = new World([[0]])
      expect(world.inspect()).toEqual('_')

    it 'gives a string representation of a 3x3 alive world', ->
      world = new World([
        [1,1,1]
        [1,1,1]
        [1,1,1]
      ])
      expect(world.inspect()).toEqual('ooo\nooo\nooo')

    it 'gives a string representation of a 3x3 dead world', ->
      world = new World([
        [0,0,0]
        [0,0,0]
        [0,0,0]
      ])
      expect(world.inspect()).toEqual('___\n___\n___')
  
  describe 'checking equality', ->
    it 'reports true for equal 1x1 worlds', ->
      world = new World([[0]])
      otherWorld = new World([[0]])
      expect(world.equals(otherWorld)).toBeTruthy()

    it 'reports false for inequal 1x1 worlds', ->
      world = new World([[0]])
      otherWorld = new World([[1]])
      expect(world.equals(otherWorld)).toBeFalsy()

  describe 'counting neighbors', ->
    it 'counts an X configuration', ->
      world = new World([
        [1,0,1]
        [0,1,0]
        [1,0,1]
      ])
      expect(world.countNeighbors(1,1)).toEqual(4)

    it 'counts a diamond configuration', ->
      world = new World([
        [0,1,0]
        [1,0,1]
        [0,1,0]
      ])
      expect(world.countNeighbors(1,1)).toEqual(4)

    it 'counts a surround configuration', ->
      world = new World([
        [1,1,1]
        [1,0,1]
        [1,1,1]
      ])
      expect(world.countNeighbors(1,1)).toEqual(8)

  describe 'ticking', ->
    describe 'with a 1-cell world', ->
      beforeEach ->
        @extinct = new World([[0]])
        @overPopulated = new World([[1]])

      describe 'with no population', ->
        it 'does not populate', ->
          next = @extinct.tick()
          expect(next.equals(@extinct)).toBeTruthy()

      describe 'with an over populated world', ->
        it 'causes extinction', ->
          next = @overPopulated.tick()
          expect(next.equals(@extinct)).toBeTruthy()
