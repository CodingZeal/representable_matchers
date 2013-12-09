shared_examples "a matcher" do
  its(:description) { should be_a_kind_of String }
  its(:failure_message_for_should) { should be_a_kind_of String }
  its(:failure_message_for_should_not) { should be_a_kind_of String }
end