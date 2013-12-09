module Representable
  module Matchers

    def have_representable_collection(property)
      HaveRepresentableCollectionMatcher.new(property)
    end

    class HaveRepresentableCollectionMatcher < BaseMatcher

      def initialize(property)
        super(property)
        add_representable_collection_submatcher
      end

      def parse_strategy(strategy)
        add_submatcher(ParseStrategyMatcher.new(@property, strategy))
        self
      end

      def description
        "only allow properties being represented by Representable"
      end

      private

      def add_representable_collection_submatcher
        add_submatcher(RepresentableCollectionMatcher.new(@property))
      end
    end
  end
end