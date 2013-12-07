if defined?(ActiveSupport::TestCase)
  ActiveSupport::TestCase.class_eval do
    include Representable::Matchers
    extend Representable::Matchers
  end
end