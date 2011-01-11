require 'aruba/api'

Then /^the output should not contain a stack trace$/ do
  all_output.should_not match(/from \/.+:\d+:in `\w+'/)
end

Then /^the output should contain an error message$/ do
  all_stderr.should match(/^digestif: /)
end

