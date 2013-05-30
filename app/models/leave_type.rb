class LeaveType < ActiveRecord::Base
  has_many :leaves, :dependent => :destroy, :class_name => "Leave" 
  has_many :number_of_leaves_per_types, :dependent => :destroy, :class_name => "NumberOfLeavesPerType"
end
