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
      leave_types << [d.leave_type.description, d.leave_type.id] 
    end
    leave_types
  end

end



