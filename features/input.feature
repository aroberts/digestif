Feature: Application input handling
  In order to understand what was wrong with my input
  As a user
  I should be presented with sensical error messages

  Scenario: program invoked with bad options
    When I run "digestif --campari"
    Then the output should not contain a stack trace
    And the output should contain an error message
    And the exit status should not be 0

    When I run "digestif -d campari"
    Then the output should not contain a stack trace
    And the output should contain an error message
    And the exit status should not be 0

  Scenario: Program invoked on nonexistent file
    When I run "digestif nonexistent_file"
    Then the output should not contain a stack trace
    And the output should contain an error message
    And the exit status should not be 0

  Scenario: Program invoked on existent and nonexistent files, together
    Given a file named "test_file" with:
    """
    test data inside
    """
    When I run "digestif test_file test_file_2"
    Then the output should contain an error message
    And the output should not contain a stack trace
    And the output should not contain a digest


