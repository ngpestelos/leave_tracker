module LeavesHelper

  def format_for_calendar (leaves)
    if leaves.respond_to? :each
      formatted_leaves = []
      leaves.each do |leave|
        formatted_leave = {
          :start => leave[:date],
          :title => "#{leave.user.email} -- #{leave[:leave_type]}",
          :leave_type => leave[:leave_type],
          :id => leave[:id],
          :allow_click => leave.user.id == current_user.id ? true : false
        } if leave.is_a? Leave
        formatted_leaves << formatted_leave
      end
    end
    formatted_leaves
  end

end



