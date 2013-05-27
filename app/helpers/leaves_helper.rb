module LeavesHelper

  def format_for_calendar (leaves)
    if leaves.respond_to? :each
      formatted_leaves = []
      leaves.each do |leave|
        formatted_leave = {
          :start => leave[:date],
          :title => 'Test title',
          :leave_type => leave[:leave_type],
          :id => leave[:id]
        } if leave.is_a? Leave
        formatted_leaves << formatted_leave
      end
    end
    formatted_leaves
  end

end



