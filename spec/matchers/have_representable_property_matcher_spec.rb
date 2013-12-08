require "spec_helper"
  
describe Representable::Matchers::HaveRepresentablePropertyMatcher do
  subject { FakeRepresentable.representation }

  it { should have_representable_property(:name) }
  it { should_not have_representable_property(:foo) }

  describe "submatchers" do

    subject { FakeRepresentable.representation }

    it { should have_representable_property(:class_only).class_name("String") }
    it { should_not have_representable_property(:class_only).class_name("Foo") }
  end
end