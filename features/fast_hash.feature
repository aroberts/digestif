Feature: Hash files quickly
  In order to hash large files quickly
  As a user
  I want to ensure that the hasher does not look at the whole file

  Scenario: Changing a file without affecting the hash
    # Given a file named "input" with:
    # """
    # This "feature" is really more of an inescapable artifact of the
    # problem we're trying to solve.  To create a hash of a really large
    # file, the biggest bottleneck with modern computers is streaming
    # 5-10 gigs off of the disk.  The actual checksumming is not hard.

    # By looking at less data, we speed up the hash process immensely, and
    # we incur the cost of vulnerability of file corruption.  Because the
    # purpose I have in mind for this tool is identity checking, not
    # corruption detection, this issue is not a problem for me.
    # """
    # And a file named "modified" with:
    # """
    # Th     ea    "     ea    mo    f     ne    ab    rt    t     he
    # problem we're trying to solve.  To create a hash of a really large
    # file, the biggest bottleneck with modern computers is streaming
    # 5-10 gigs off of the disk.  The actual checksumming is not hard.

    # By looking at less data, we speed up the hash process immensely, and
    # we incur the cost of vulnerability of file corruption.  Because the
    # purpose I have in mind for this tool is identity checking, not
    # corruption detection, this issue is not a problem for me.
    # """
    Given a file named "input" with:
    """
    two words, and not a moment too soon
    """
    And a file named "modified" with:
    """
    tw0000rd0000nd0000 a0000en0000o 0000
    """
    When I run "digestif -s 4 -r 2 input"
    And I run "digestif -s 4 -r 2 modified"
    Then the output should be 2 identical digests

