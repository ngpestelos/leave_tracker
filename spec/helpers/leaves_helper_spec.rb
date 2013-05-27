require 'spec_helper'

describe LeavesHelper do
  describe '#format_for_calendar' do
    context 'when an array of leaves are sent' do
      it 'formats the leaves' do
        time = Time.now
        leave = Leave.create(:date => time)
        formatted_leaves = format_for_calendar([leave])
        formatted_leaves.should eq([{:start => time, :title => 'Test title'}])
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
