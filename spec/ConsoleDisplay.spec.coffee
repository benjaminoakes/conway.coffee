ConsoleDisplay = require('../lib/ConsoleDisplay').ConsoleDisplay

describe ConsoleDisplay, ->
  beforeEach ->
    @display = new ConsoleDisplay

  describe 'when changed', ->
    it 'logs to the console', ->
      spyOn(console, 'log')
      spyOn(console, 'dir')

      @display.notify('changed', 'state')

      expect(console.log).wasCalled()
      expect(console.dir).wasCalledWith('state')
