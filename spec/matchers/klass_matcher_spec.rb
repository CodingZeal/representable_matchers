require "spec_helper"

class Foo
end

describe Representable::Matchers::KlassMatcher do
  it_should_behave_like "a matcher"
 
  let(:property) { :foo }
  let(:klass) { Foo }

  subject { Representable::Matchers::KlassMatcher.new(property, klass) }

  describe "#matches?" do
    let(:subject_object) { double("subject_object") }

    context "when it matches" do
      before do
        subject_object.stub_chain(:send, :[], :options, :[]).and_return(klass)
      end

      it "calls on the representable object for it's attributes" do
        expect( subject.matches?(subject_object) ).to be_true
      end
    end

    context "when it doesn't match" do
      before do
        subject_object.stub_chain(:send, :[], :options, :[]).and_return(Array)
      end

      it "calls on the representable object for it's attributes" do
        expect( subject.matches?(subject_object) ).to be_false
      end
    end
  end
end