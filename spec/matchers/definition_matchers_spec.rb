require "spec_helper"

class Fake < Representable::Matchers::BaseMatcher
  include Representable::Matchers::DefinitionMatchers
end

describe Representable::Matchers::DefinitionMatchers do
  subject { Fake.new(property) }
  let(:property) { :foo }

  describe "#class_name" do
    let(:class_name) { "Foo" }

    it "adds a ClassNameMatcher" do
      Representable::Matchers::ClassNameMatcher.should_receive(:new).with(property, class_name)
      expect( subject.class_name(class_name) ).to eq(subject)
    end
  end

  describe "#extends" do
    let(:extension) { Representable }

    it "adds a ExtensionOfMatcher" do
      Representable::Matchers::ExtensionOfMatcher.should_receive(:new).with(property, extension)
      expect( subject.extends(extension) ).to eq(subject)
    end
  end
end