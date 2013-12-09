module Representable
  module Matchers
    class RepresentableCollectionMatcher < SubMatcher

      def matches?(subject)
        super(subject)
        collection?
      end

      def description
        "only allow representable collection"
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