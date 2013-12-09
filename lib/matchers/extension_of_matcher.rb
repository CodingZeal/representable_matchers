module Representable
  module Matchers
    class ExtensionOfMatcher < SubMatcher

      def initialize(property, extension)
        super(property)
        @extension = extension
      end

      def matches?(subject)
        super(subject)
        matches_extension?
      end

      def description
        "only allow representable properties extending specific representers"
      end

      private

      def matches_extension?
        @subject.send(:representable_attrs)[property].options[:extend] == @extension
      end

      def expectation
        "#{@subject.class} to be a representation of #{@extension}"
      end
    end
  end
end