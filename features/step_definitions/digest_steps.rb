require 'aruba/api'

Then /^the output should be (a|\d+) digest(?:s?)$/ do |count|
  count = 1 if count == 'a'
  count = count.to_i

  lines = all_output.split("\n")
  lines.size.should == count
  lines.each { |line| line.should match(/^[a-z0-9]+$/) }
end

Then /^the output should not contain a digest$/ do
  all_output.split('\n').each { |l| l.should_not match(/^[a-z0-9]+$/) }
end

Then /^the output should be (\d+) identical digests$/ do |count|
  count = count.to_i

  lines = all_output.split("\n")
  lines.size.should == count
  lines.each { |line| line.should == lines[0] }
end
