require "spec_helper"

describe Representable::Matchers do
  subject { FakeRepresentable.representation }
  let(:fake_matcher) { double(:fake_matcher) }

  describe "#render_json" do
    before do
      Representable::Matchers::RenderJsonMatcher.should_receive(:new).and_return(fake_matcher)
      fake_matcher.stub(:matches?).and_return(true)
      fake_matcher.stub(:description).and_return("Blah")
    end

    it { expect(subject).to render_json }
  end
end