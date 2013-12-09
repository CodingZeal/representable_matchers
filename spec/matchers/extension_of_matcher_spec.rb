require "spec_helper"

describe Representable::Matchers::ExtensionOfMatcher do
  it_should_behave_like "a matcher"

  let(:property) { :foo }
  let(:extension) { Module }

  subject { Representable::Matchers::ExtensionOfMatcher.new(property, extension) }

  describe "#matches?" do
    let(:fake_representation) { FakeRepresentable.representation }

    context "when it matches" do

      before do
        fake_representation.stub_chain(:send, :[], :options, :[]).with(:extend).and_return(extension)
      end

      it do
        expect( subject.matches?(fake_representation) ).to be_true
      end
    end

    context "when it doesn't match" do

      before do
        fake_representation.stub_chain(:send, :[], :options, :[]).with(:extend).and_return(Representable)
      end

      it do
        expect( subject.matches?(fake_representation) ).to be_false
      end
    end
  end
end