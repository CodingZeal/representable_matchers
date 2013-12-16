module Representable
  module Matchers
    class BaseMatcher

      def initialize(property=nil)
        if not property.nil?
          @property = property 
        end
      end

      def matches?(subject)
        @subject = subject
      end

      def description
        ""
      end

      def failure_message_for_should
        submatcher_failure_messages_for_should.last or raise "Undefined failure message for should"
      end

      def failure_message_for_should_not
        submatcher_failure_messages_for_should_not.last or raise "Undefined failure message for should not"
      end

      protected

      def property
        @property
      end

      private

      def submatchers
        @submatchers ||= []
      end

      def add_submatcher(submatcher)
        submatchers << submatcher
      end

      def submatchers_match?
        failing_submatchers.empty?
      end

      def failing_submatchers
        @failing_submatchers ||= submatchers.select { |matcher| !matcher.matches?(@subject) }
      end

      def submatcher_failure_messages_for_should
        failing_submatchers.map(&:failure_message_for_should)
      end

      def submatcher_failure_messages_for_should_not
        failing_submatchers.map(&:failure_message_for_should_not)
      end
    end
  end
end