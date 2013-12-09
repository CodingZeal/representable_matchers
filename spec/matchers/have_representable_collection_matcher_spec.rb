require "spec_helper"

describe Representable::Matchers do
  subject { FakeRepresentable.representation }

  describe "#have_representable_collection" do
    context "without submatchers" do
      it { should have_representable_collection(:children) }
    end

    context "with submatchers" do
      it { should have_representable_collection(:children).klass(Array).extends(AbstractRepresenter).parse_strategy(:sync) }
    end
  end
end
  
describe Representable::Matchers::HaveRepresentableCollectionMatcher do
  let(:property) { :foo }
  let(:fake_matcher) { double("fake_matcher") }
  let(:fake_representation) { double("fake_representation") }

  subject { Representable::Matchers::HaveRepresentableCollectionMatcher.new(property) }

  before do
    Representable::Matchers::RepresentableCollectionMatcher.should_receive(:new).with(property).and_return(fake_matcher)
  end

  describe "#parse_strategy" do
    let(:parse_strategy) { :sync }

    it "adds a ParseStrategyMatcher" do
      Representable::Matchers::ParseStrategyMatcher.should_receive(:new).with(property, parse_strategy)
      expect( subject.parse_strategy(parse_strategy) ).to eq(subject)
    end
  end

  its(:description) { should be_a_kind_of String }
end
