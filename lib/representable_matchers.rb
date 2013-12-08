require "matchers/version"
require "matchers/class_name_matcher"
require "matchers/representable_property_matcher"
require "matchers/have_representable_property_matcher"

# bind the matchers to the test mech
require 'matchers/integrations/rspec' if defined?(RSpec)
require 'matchers/integrations/test_unit' 