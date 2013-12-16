require "spec_helper"

describe Representable::Matchers::RenderJsonMatcher do
  it_should_behave_like "a matcher"

  subject { Representable::Matchers::RenderJsonMatcher.new }

  describe "#matches?" do
    let(:fake_representation) { FakeRepresentable.representation }

    before { fake_representation.stub(:respond_to?).with(:to_json).and_return(to_json) }

    context "when it matches" do
      let(:to_json) { true }
      it { expect( subject.matches?(fake_representation) ).to be_true }
    end

    context "when it doesn't match" do
      let(:to_json) { false }
      it { expect( subject.matches?(fake_representation) ).to be_false }
    end
  end
end