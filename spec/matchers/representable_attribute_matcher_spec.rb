require "spec_helper"

describe Representable::Matchers::RepresentablePropertyMatcher do
  it_should_behave_like "a matcher"

  let(:property) { :foo }
  subject { Representable::Matchers::RepresentablePropertyMatcher.new(property) }

  describe "#matches?" do
    let(:subject_object) { double("subject_object") }

    before do
      subject_object.stub_chain(:send, :[]).and_return(representable_property)
    end

    context "when present" do
      let(:representable_property) { double("representable_property") }

      it "asserts the existance of the property" do
        expect( subject.matches?(subject_object) ).to be_true
      end
    end

    context "when nil" do
      let(:representable_property) { nil }

      it "asserts the existance of the property" do
        expect( subject.matches?(subject_object) ).to be_false
      end
    end
  end
end