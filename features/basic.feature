Feature: Basic application operation
  In order to compare files based on content
  As a user
  I want to be told the hash digest of files

  Background:
    Given a file named "test_file" with:
    """
    This file is a test file for md5 to hash
    """
    And a file named "test_file_2" with:
    """
    This is another test file.
    """

  Scenario: Hashing a file
    When I run "digestif -d md5 test_file"
    Then the output should be a digest

  Scenario: Hashing 2 files
    When I run "digestif -d sha1 test_file test_file_2"
    Then the output should be 2 digests 
