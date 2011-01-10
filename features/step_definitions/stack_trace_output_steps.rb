require 'aruba/api'

Then /^the output should not contain a stack trace$/ do
  all_output.should_not match(/from \/.+:\d+:in `\w+'/)
end

# from /usr/local/lib/ruby/1.8/optparse.rb:1295:in `parse_in_order'
