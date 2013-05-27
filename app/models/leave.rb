class Leave < ActiveRecord::Base
 validates :date, :presence => true 
 validates :leave_type, :presence => true
 belongs_to :user, :class_name => "User"
end
