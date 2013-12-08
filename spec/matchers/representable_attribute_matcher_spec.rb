require "spec_helper"

describe Representable::Matchers::RepresentablePropertyMatcher do
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

  its(:description) { should be_a_kind_of String }
  its(:failure_message_for_should) { should be_a_kind_of String }
  its(:failure_message_for_should_not) { should be_a_kind_of String }
end