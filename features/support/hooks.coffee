TestServer = require '../../test_server'
chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'
chai.use require 'chai-as-promised'

global.expect = chai.expect
global.sinon = sinon


module.exports = ->

  @Before (scenario, done) =>
    @server = new TestServer
    done()

  @After (scenario, done) =>
    # @server.close()
    done()

  @Before {tags: ['@fakeTimers']}, (scenario, done) =>
    @clock = sinon.useFakeTimers()
    done()

  @After {tags: ['@fakeTimers']}, (scenario, done) =>
    @clock.restore()
    done()
