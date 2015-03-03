require 'rspec/rails'
# This file was generated by the `rails generate rspec:install` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause
# this file to always be loaded, without a need to explicitly require it in any
# files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, consider making
# a separate helper file that requires the additional dependencies and performs
# the additional setup, and require it from the spec files that actually need
# it.
#
# The `.rspec` file also contains a few flags that are not defaults but that
# users commonly want.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end


end

# Returns true if a test user is logged in.
    def is_logged_in?
!session[:user_id].nil?
end

# Logs in a test user.
def log_in_as(user, options = {})
  password    = options[:password]    || 'password'
  if integration_test?
    post login_path, session: { email:       user.email,
                                password:    password,
                                                        }
  else
    session[:user_id] = user.id
  end
end


private

# Returns true inside an integration test.
def integration_test?
  defined?(post_via_redirect)
end
