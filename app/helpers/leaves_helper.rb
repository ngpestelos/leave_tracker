module LeavesHelper

  def format_for_calendar (leaves)
    if leaves.respond_to? :each
      formatted_leaves = []
      leaves.each do |leave|
        description = LeaveType.find(leave[:leave_type_id]).description
        formatted_leave = {
          :start => leave[:date],
          :title => "#{leave.user.email} -- #{description}",
          :leave_type => leave[:leave_type],
          :id => leave[:id],
          :allow_click => leave.user.id == current_user.id ? true : false
        } if leave.is_a? Leave
        formatted_leaves << formatted_leave
      end
    end
    formatted_leaves
  end

  def get_leave_types
    leave_types = []
    current_user.number_of_leaves_per_types.each do |d|
      if has_remaining_leaves d.leave_type
        leave_types << [d.leave_type.description, d.leave_type.id] 
      end
    end
    leave_types
  end

  def get_remaining_leaves
    remaining_leaves = []
    current_user.number_of_leaves_per_types.each do |d|
      left = d.number - current_user.leaves.where(:leave_type_id => d.leave_type_id).count
      description = d.leave_type.description
      remaining_leaves << {:left => left, :description => description}
    end
    remaining_leaves
  end

  def has_remaining_leaves leave_type
    current_count_by_leave_type = current_user.leaves.where(:leave_type_id => leave_type.id).count
    max_count_by_leave_type = current_user.number_of_leaves_per_types.find_by_leave_type_id(leave_type.id).number
    !max_count_by_leave_type.nil? && current_count_by_leave_type < max_count_by_leave_type
  end
end



