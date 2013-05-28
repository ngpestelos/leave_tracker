class NumberOfLeavesPerType < ActiveRecord::Base
  belongs_to :leave_type, :class_name => "LeaveType"
  belongs_to :user, :class_name => "User"
end
