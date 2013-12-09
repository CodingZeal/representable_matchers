require "spec_helper"

class Fake < Representable::Matchers::BaseMatcher
  include Representable::Matchers::DefinitionMatchers
end

class Foo
end

describe Representable::Matchers::DefinitionMatchers do
  subject { Fake.new(property) }
  let(:property) { :foo }

  describe "#klass" do
    let(:klass) { Foo }

    it "adds a KlassMatcher" do
      Representable::Matchers::KlassMatcher.should_receive(:new).with(property, klass)
      expect( subject.klass(klass) ).to eq(subject)
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