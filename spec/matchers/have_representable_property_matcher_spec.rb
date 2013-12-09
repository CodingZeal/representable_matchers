require "spec_helper"

describe Representable::Matchers do
  describe "#have_representable_property" do
    
    subject { FakeRepresentable.representation }
    
    context "without submatchers" do
      it { should have_representable_property(:name) }
      it { should_not have_representable_property(:foo) }
    end

    context "with submatchers" do
      it { should have_representable_property(:class_only).class_name("String") }
      it { should have_representable_property(:class_and_extension).class_name("Array").extends(AbstractRepresenter) }
    end
  end
end
  
describe Representable::Matchers::HaveRepresentablePropertyMatcher do
  let(:property) { :foo }
  let(:fake_matcher) { double("fake_matcher") }
  let(:fake_representation) { double("fake_representation") }

  subject { Representable::Matchers::HaveRepresentablePropertyMatcher.new(property) }

  before do
    Representable::Matchers::RepresentablePropertyMatcher.should_receive(:new).with(property).and_return(fake_matcher)
    fake_matcher.stub(:matches?).and_return(true)
  end

  describe "#matches?" do
    before do
      fake_matcher.should_receive(:matches?).with(fake_representation).and_return(matches?)
    end

    context "when it matches" do
      let(:matches?) { true }
      it { expect( subject.matches?(fake_representation) ).to be_true }
    end

    context "when it doesn't match" do
      let(:matches?) { false }
      it { expect( subject.matches?(fake_representation) ).to be_false }
    end
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
    its(:description) { should be_a_kind_of String }
  end
end