module Representable
  module Matchers
    
    class ExtensionOfMatcher < Struct.new(:property, :extension)

      def matches?(subject)
        @subject = subject
        matches_extension?
      end

      def description
        "only allow representable properties extending specific representers"
      end

      def failure_message_for_should
        "Expected #{expectation}"
      end

      def failure_message_for_should_not
        "Did not expect #{expectation}"
      end

      private

      def matches_extension?
        @subject.send(:representable_attrs)[property].options[:extend] == extension
      end

      def expectation
        "#{@subject.class} to be a representation of #{extension}"
      end
    end
  end
end