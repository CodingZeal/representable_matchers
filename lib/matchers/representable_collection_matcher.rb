module Representable
  module Matchers
    class RepresentableCollectionMatcher < BaseMatcher

      def matches?(subject)
        super(subject)
        collection?
      end

      def description
        "only allow representable collection"
      end

      def failure_message_for_should
        "Expected #{expectation}"
      end

      def failure_message_for_should_not
        "Did not expect #{expectation}"
      end

      private

      def collection?
        @subject.send(:representable_attrs)[property].options[:collection] == true
      end

      def expectation
        "#{@subject.class} to be a collection"
      end
    end
  end
end