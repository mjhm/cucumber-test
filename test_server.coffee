
EventEmitter = require 'events'
Promise = require 'bluebird'

module.exports = class TestServer
  constructor: ->
    @eventCount = 0
    @emitter = new EventEmitter
    @emitter.once 'shutdown', ->
      process.exit 0

  close: ->
    @emitter.emit 'shutdown'

  reset: ->
    @eventCount = 0

  sendDelayedIncrement: (msec) =>
    new Promise (resolve, reject) =>
      setTimeout ( =>
        @eventCount += 1
        resolve @eventCount
      ), msec
