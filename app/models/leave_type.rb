class LeaveType < ActiveRecord::Base
 has_many :leaves, :class_name => "Leave" 
 has_many :number_of_leaves_per_types, :class_name => "NumberOfLeavesPerType"
end
