module Representable
  module Matchers
    class ParseStrategyMatcher < SubMatcher

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

      private

      def matches_strategy?
        @subject.send(:representable_attrs)[property].options[:parse_strategy] == @strategy
      end

      def expectation
        "#{@subject.class} to be using parse strategy #{@strategy}"
      end
    end
  end
end