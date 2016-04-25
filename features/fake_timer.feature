Feature: Fake Timer Feature

  Scenario: Run the timeout test in real time
    When the test runs in real time
    Then the event count is "1"


  @fakeTimers
  Scenario: Run the timeout test with a fake timer
    When the test runs with a fake timer
    Then the event count is "1"
