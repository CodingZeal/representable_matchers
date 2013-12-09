module Representable
  module Matchers
    class RepresentablePropertyMatcher < SubMatcher

      def matches?(subject)
        super(subject)
        representable_attribute?
      end

      def description
        "only allow models with specific representable properties"
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