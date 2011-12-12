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

  describe 'the next state', ->
    describe 'with a 1-cell world', ->
      beforeEach ->
        @extinct = new World([[0]])
        @overPopulated = new World([[1]])

      describe 'with no population', ->
        it 'does not populate', ->
          next = new World(@extinct.next())
          expect(next.equals(@extinct)).toBeTruthy()

      describe 'with an over populated world', ->
        it 'causes extinction', ->
          next = new World(@overPopulated.next())
          expect(next.equals(@extinct)).toBeTruthy()

    describe 'with a block', ->
      it 'is a still life', ->
        block = new World([
          [0,0,0,0]
          [0,1,1,0]
          [0,1,1,0]
          [0,0,0,0]
        ])
        next = new World(block.next())

        expect(next.equals(block)).toBeTruthy()

    describe 'with a beehive', ->
      it 'is a still life', ->
        beehive = new World([
          [0,0,0,0,0,0]
          [0,0,1,1,0,0]
          [0,1,0,0,1,0]
          [0,0,1,1,0,0]
          [0,0,0,0,0,0]
        ])
        next = new World(beehive.next())

        expect(next.equals(beehive)).toBeTruthy()

    describe 'with a blinker', ->
      it 'is an oscillator', ->
        blinker1 = new World([
          [0,0,0,0,0]
          [0,0,1,0,0]
          [0,0,1,0,0]
          [0,0,1,0,0]
          [0,0,0,0,0]
        ])
        next = new World(blinker1.next())

        blinker2 = new World([
          [0,0,0,0,0]
          [0,0,0,0,0]
          [0,1,1,1,0]
          [0,0,0,0,0]
          [0,0,0,0,0]
        ])

        expect(next.equals(blinker2)).toBeTruthy()

  describe 'ticking', ->
    it 'replaces the grid with the next state', ->
      world = new World([])
      expect(world.grid).toEqual([])
      spyOn(world, 'next').andReturn('next state')
      world.tick()
      expect(world.grid).toEqual('next state')

  describe 'observing', ->
    it 'notifies observers when a change occurs', ->
      observer =
        notify: ->
      spyOn(observer, 'notify')

      world = new World([])
      world.registerObserver(observer)
      world.tick()
      
      expect(observer.notify).wasCalledWith('changed', world)
