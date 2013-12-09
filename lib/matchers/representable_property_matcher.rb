module Representable
  module Matchers
    class RepresentablePropertyMatcher < BaseMatcher

      def matches?(subject)
        super(subject)
        representable_attribute?
      end

      def description
        "only allow models with specific representable properties"
      end

      def failure_message_for_should
        "Expected #{expectation}"
      end

      def failure_message_for_should_not
        "Did not expect #{expectation}"
      end

      private

      def representable_attribute?
        !@subject.send(:representable_attrs)[property].nil?
      end

      def expectation
        "#{@subject} to be a Representable property"
      end
    end
  end
end