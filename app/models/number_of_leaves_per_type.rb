class NumberOfLeavesPerType < ActiveRecord::Base
  belongs_to :leave_type, :class_name => "LeaveType"
  belongs_to :user, :class_name => "User"
  validates :leave_type_id, :presence => true
  validates :number, :presence => true
end
