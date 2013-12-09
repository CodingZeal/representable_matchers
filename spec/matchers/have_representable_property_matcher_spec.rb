require "spec_helper"

describe Representable::Matchers do
  subject { FakeRepresentable.representation }
  
  describe "#have_representable_property" do  
    context "without submatchers" do
      it { should have_representable_property(:name) }
      it { should_not have_representable_property(:foo) }
    end

    context "with submatchers" do
      it { should have_representable_property(:class_only).klass(String) }
      it { should have_representable_property(:class_and_extension).klass(Array).extends(AbstractRepresenter) }
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

  describe "#description" do
    it { expect( subject.description ).to be_a_kind_of String }
  end
end