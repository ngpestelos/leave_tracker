require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the LeavesHelper. For example:
#
# describe LeavesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe LeavesHelper do
  describe '#format_for_calendar' do
    context 'when an array of leaves are sent' do
      it 'formats the leaves' do
        time = Time.now
        formatted_leaves = format_for_calendar([{:date => time}])
        formatted_leaves.should eq([{:start => time, :title => 'Test title'}])
      end
    end
  end
end
