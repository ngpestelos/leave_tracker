module LeavesHelper

  def format_for_calendar (leaves)
    if leaves.respond_to? :each
      formatted_leaves = []
      leaves.each do |leave|
        description = LeaveType.find(leave[:leave_type_id]).description
        formatted_leave = {
          :start => leave[:date],
          :title => "#{leave.user.email} -- #{description}",
          :leave_type_id => leave[:leave_type_id],
          :id => leave[:id],
          :allow_click => leave.user.id == current_user.id || current_user.role == "hr" ? true : false
        } if leave.is_a? Leave
        formatted_leaves << formatted_leave
      end
    end
    formatted_leaves
  end

  def get_leave_types
    leave_types = []
    current_user.number_of_leaves_per_types.each do |leave_type|
      left = get_remaining_leaves leave_type 
      leave_types << ["#{leave_type.leave_type.description} (#{left})", leave_type.leave_type.id] 
    end
    leave_types
  end

  def get_remaining_leaves leave_type
    left = leave_type.number - current_user.leaves.where(:leave_type_id => leave_type.leave_type_id).count
  end

  def has_remaining_leaves leave_type
    current_count_by_leave_type = current_user.leaves.where(:leave_type_id => leave_type.id).count
    max_count_by_leave_type = current_user.number_of_leaves_per_types.find_by_leave_type_id(leave_type.id).number
    !max_count_by_leave_type.nil? && current_count_by_leave_type < max_count_by_leave_type
  end
end



