module Representable
  module Matchers
    class SubMatcher < BaseMatcher
      def failure_message_for_should
        "Expected #{expectation}"
      end

      def failure_message_for_should_not
        "Did not expect #{expectation}"
      end
    end
  end
end