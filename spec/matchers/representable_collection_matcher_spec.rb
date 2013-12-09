require "spec_helper"

describe Representable::Matchers::RepresentableCollectionMatcher do
  it_should_behave_like "a matcher"

  let(:property) { :foo }
  let(:collection) { true }

  subject { Representable::Matchers::RepresentableCollectionMatcher.new(property) }

  describe "#matches?" do
    let(:fake_representation) { FakeRepresentable.representation }

    context "when it matches" do
      before do
        fake_representation.stub_chain(:send, :[], :options, :[]).with(:collection).and_return(collection)
      end

      it do
        expect( subject.matches?(fake_representation) ).to be_true
      end
    end

    context "when it doesn't match" do
      let(:collection) { false }

      before do
        fake_representation.stub_chain(:send, :[], :options, :[]).with(:collection).and_return(collection)
      end

      it do
        expect( subject.matches?(fake_representation) ).to be_false
      end
    end
  end
end