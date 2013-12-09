module Representable
  module Matchers
    class KlassMatcher < SubMatcher

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