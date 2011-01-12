require 'aruba/api'

Then /^the output should not contain a stack trace$/ do
  all_output.should_not match(/from \/.+:\d+:in `\w+'/)
end

Then /^there should be an error message$/ do
  all_stderr.should match(/^digestif: /)
end

Then /^the output should be empty$/ do
  all_output.should match(/^$/)
end
