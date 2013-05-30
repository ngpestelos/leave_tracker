class Leave < ActiveRecord::Base
  validates :date, :leave_type_id, :presence => true 
  belongs_to :user, :class_name => "User"
  belongs_to :leave_type, :class_name => "LeaveType"

  after_validation :check_remaining_leaves

  private

  def check_remaining_leaves
    if self.errors.blank?
      user = User.find(self.user_id)
      if self.id.nil?
        current_count_by_leave_type = user.leaves.where(:leave_type_id => self.leave_type_id).count
        max_count_by_leave_type = user.number_of_leaves_per_types.find_by_leave_type_id(self.leave_type_id).number
        if current_count_by_leave_type == max_count_by_leave_type
          return false
        else
          return true
        end
      end
    end
  end
end
