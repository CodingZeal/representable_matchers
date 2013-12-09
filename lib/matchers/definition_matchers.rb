module Representable
  module Matchers
    module DefinitionMatchers
      def klass(klass)
        add_submatcher(KlassMatcher.new(property, klass))
        self
      end

      def extends(extension)
        add_submatcher(ExtensionOfMatcher.new(property, extension))
        self
      end
    end
  end
end