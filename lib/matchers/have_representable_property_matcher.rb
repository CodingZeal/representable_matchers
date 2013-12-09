module Representable
  module Matchers

    def have_representable_property(property)
      HaveRepresentablePropertyMatcher.new(property)
    end

    class HaveRepresentablePropertyMatcher < BaseMatcher

      def initialize(property)
        super(property)
        add_representable_property_submatcher
      end

      def description
        "only allow properties being represented by Representable"
      end

      private

      def add_representable_property_submatcher
        add_submatcher(RepresentablePropertyMatcher.new(@property))
      end
    end
  end
end