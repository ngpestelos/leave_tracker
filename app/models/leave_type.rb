class LeaveType < ActiveRecord::Base
 has_many :leaves, :class_name => "Leave" 
end
