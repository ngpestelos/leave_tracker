module LeavesHelper

  def format_for_calendar (leaves)
    formatted_leaves = []
    leaves.each do |leave|
      formatted_leave = {
        :start => leave[:date],
        :title => 'Test title'
      }
      formatted_leaves << formatted_leave
    end
    formatted_leaves
  end

end

