Feature: Basic application operation
  Scenario: program invoked with bad options
    When I run "digestif --campari"
    Then the output should not contain a stack trace

    When I run "digestif -d campari"
    Then the output should not contain a stack trace
