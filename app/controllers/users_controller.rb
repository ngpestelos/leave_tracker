class UsersController < ApplicationController

  def index
    if user_signed_in?
      if current_user.role == "hr"
        @users = User.all
      else
        redirect_to leaves_path
      end
    else
      redirect_to new_user_session_path
    end
  end
  
  def leaves 
    user = User.find_by_id(params[:id])
    user_leave_types = user.number_of_leaves_per_types
    @leave_types_display = []
    user_leave_types.each do |leave_type|
      leave_type_description = LeaveType.find_by_id(leave_type.leave_type_id).description
      leave_type_number = leave_type.number
      @leave_types_display << {:id => leave_type.id, :description => leave_type_description, :number => leave_type_number}
    end
  end

  def update
    user = User.find(params[:id])
    leave_to_change = user.number_of_leaves_per_types.find_by_leave_type_id(params[:pk])
    leave_to_change.update_attributes(:number => params[:value])
    render :json => true
  end
end
