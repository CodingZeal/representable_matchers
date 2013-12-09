module Representable
  module Matchers
    class ParseStrategyMatcher < BaseMatcher

      def initialize(property, strategy)
        super(property)
        @strategy = strategy
      end

      def matches?(subject)
        super(subject)
        matches_strategy?
      end

      def description
        "only allow representable collection to use a specific parse strategy"
      end

      def failure_message_for_should
        "Expected #{expectation}"
      end

      def failure_message_for_should_not
        "Did not expect #{expectation}"
      end

      private

      def matches_strategy?
        @subject.send(:representable_attrs)[property].options[:parse_strategy] == @strategy
      end

      def expectation
        "#{@subject.class} to be a kind of #{@strategy}"
      end
    end
  end
end