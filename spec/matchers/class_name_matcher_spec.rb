require "spec_helper"

describe Representable::Matchers::ClassNameMatcher do
  it_should_behave_like "a matcher"
 
  let(:property) { :foo }
  let(:class_name) { "Person" }

  subject { Representable::Matchers::ClassNameMatcher.new(property, class_name) }

  describe "#matches?" do
    let(:subject_object) { double("subject_object") }

    context "when it matches" do
      before do
        subject_object.stub_chain(:send, :[], :options, :[], :to_s).and_return(class_name)
      end

      it "calls on the representable object for it's attributes" do
        expect( subject.matches?(subject_object) ).to be_true
      end
    end

    context "when it doesn't match" do
      before do
        subject_object.stub_chain(:send, :[], :options, :[], :to_s).and_return("Dog")
      end

      it "calls on the representable object for it's attributes" do
        expect( subject.matches?(subject_object) ).to be_false
      end
    end
  end
end