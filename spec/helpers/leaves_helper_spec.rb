require 'spec_helper'

describe LeavesHelper do
  describe '#format_for_calendar' do
    context 'when an array of leaves are sent' do
      it 'formats the leaves' do
        time = Time.now
        leave = Leave.create(:date => time, :leave_type => 1, :id => 1)
        formatted_leaves = format_for_calendar([leave])
        formatted_leaves.should eq([{:start => time, :title => 'Test title', :leave_type => 1, :id => 1}])
      end
    end
    context 'when nil is sent' do
      it 'returns nil' do
        formatted_leaves = format_for_calendar(nil)
        formatted_leaves.should be_nil 
      end
    end
    context 'when not an array is sent' do
      it 'returns nil' do
        formatted_leaves = format_for_calendar("NOT AN ARRAY")
        formatted_leaves.should be_nil
      end
    end
  end
end
