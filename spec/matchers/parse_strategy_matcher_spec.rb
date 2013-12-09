require "spec_helper"

describe Representable::Matchers::ParseStrategyMatcher do
  it_should_behave_like "a matcher"
 
  let(:property) { :foo }
  let(:strategy) { :sync }

  subject { Representable::Matchers::ParseStrategyMatcher.new(property, strategy) }

  describe "#matches?" do
    let(:parse_strategy) { :sync }
    let(:fake_representation) { double("fake_representation") }

    context "when it matches" do
      before do
        fake_representation.stub_chain(:send, :[], :options, :[]).with(:parse_strategy).and_return(parse_strategy)
      end

      it "calls on the representable object for it's attributes" do
        expect( subject.matches?(fake_representation) ).to be_true
      end
    end

    context "when it doesn't match" do
      before do
        fake_representation.stub_chain(:send, :[], :options, :[], :to_s).and_return(:dont_sync)
      end

      it "calls on the representable object for it's attributes" do
        expect( subject.matches?(fake_representation) ).to be_false
      end
    end
  end
end