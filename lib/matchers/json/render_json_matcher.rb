module Representable
  module Matchers
    def render_json
      RenderJsonMatcher.new
    end

    class RenderJsonMatcher < SubMatcher
      def matches?(subject)
        @subject = subject
        responds_to_json?
      end

      def description
        "only allow objects rendering json representations"
      end

      private

      def responds_to_json?
        @subject.respond_to? :to_json
      end

      def expectation
        "to render json"
      end
    end
  end
end