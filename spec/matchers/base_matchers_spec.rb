require "spec_helper"

describe Representable::Matchers::BaseMatcher do
  let(:property) { :foo }
  let(:fake_matcher) { double("fake_matcher") }
  let(:fake_representation) { double("fake_representation") }

  subject { Representable::Matchers::BaseMatcher.new(property) }

  describe "#matches?" do
    it { expect( subject.matches?(fake_representation) ).to be_true }
  end

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

  describe "#description" do
    it { expect( subject.description ).to be_a_kind_of(String) }
  end

  describe "#failure_message_for_should" do
    it { expect { subject.failure_message_for_should }.to raise_error }
  end

  describe "#failure_message_for_should" do
    it { expect { subject.failure_message_for_should_not }.to raise_error }
  end
end