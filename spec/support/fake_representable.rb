class FakeRepresentable
  module Representer
    include Representable::JSON
    property :name
    property :class_only, class: String
    property :class_and_extension, class: Array
  end

  def self.representation
    new.extend(Representer)
  end
end