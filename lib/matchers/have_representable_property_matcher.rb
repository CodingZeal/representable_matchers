module Representable
  module Matchers

    def have_representable_property(property)
      HaveRepresentablePropertyMatcher.new(property)
    end

    class HaveRepresentablePropertyMatcher

      def initialize(property)
        @property = property
        add_representable_property_submatcher
      end

      def class_name(class_name)
        add_submatcher(ClassNameMatcher.new(@property, class_name))
        self
      end

      def extends(extension)
        add_submatcher(ExtensionOfMatcher.new(@property, extension))
        self
      end

      def matches?(subject)
        @subject = subject
        submatchers_match?
      end

      def description
        "only allow properties being represented by Representable"
      end

      def failure_message_for_should
        submatcher_failure_messages_for_should.last
      end

      def failure_message_for_should_not
        submatcher_failure_messages_for_should_not.last
      end

      private

      def add_representable_property_submatcher
        add_submatcher(RepresentablePropertyMatcher.new(@property))
      end

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