require 'rspec'
require 'rspec/autorun'
require 'representable'
require 'representable/json'
require 'representable_matchers'

PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..')).freeze
Dir[File.join(PROJECT_ROOT, 'spec/support/**/*.rb')].each { |file| require(file) }

# bind the matchers to the test mech
require 'integrations/rspec' if defined?(RSpec)
require 'integrations/test_unit'

RSpec.configure do |c|
  c.filter_run_excluding :skip_on_windows => !(RbConfig::CONFIG['host_os'] =~ /mingw32/).nil?
end