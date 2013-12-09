module Representable
  module Matchers
    module DefinitionMatchers
      def class_name(class_name)
        add_submatcher(ClassNameMatcher.new(property, class_name))
        self
      end

      def extends(extension)
        add_submatcher(ExtensionOfMatcher.new(property, extension))
        self
      end
    end
  end
end