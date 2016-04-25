

module.exports = ->

  @When /^the test runs in real time$/,  =>
    @server.sendDelayedIncrement 2000


  @Then /^the event count is "([^"]*)"$/, (targetCount) =>
    expect(@server.eventCount).to.equal +targetCount


  @When /^the test runs with a fake timer$/,  =>
    @server.sendDelayedIncrement 6000
    @clock.tick(6010)
