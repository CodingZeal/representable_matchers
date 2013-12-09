module Representable
  module Matchers
    class KlassMatcher < BaseMatcher

      def initialize(property, klass)
        super(property)
        @klass = klass
      end

      def matches?(subject)
        super(subject)
        matches_class?
      end

      def description
        "only allow representable property of a specific class"
      end

      def failure_message_for_should
        "Expected #{expectation}"
      end

      def failure_message_for_should_not
        "Did not expect #{expectation}"
      end

      private

      def matches_class?
        @subject.send(:representable_attrs)[property].options[:class] == @klass
      end

      def expectation
        "#{@subject.class} to be a kind of #{@klass}"
      end
    end
  end
end