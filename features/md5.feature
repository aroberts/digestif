Feature: Hash a file using md5
  Scenario: fully hash a file with md5
    Given a file named "test_file" with:
    """
    This file is a test file for md5 to hash
    """
    When I run "digestif -d md5 test_file"
    Then the output should contain:
    """
    Hash of file
    """
