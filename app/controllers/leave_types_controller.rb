class LeaveTypesController < ApplicationController
  
  def index
    if user_signed_in?
      if current_user.role == "hr"
        @leave_types = LeaveType.all
      else
        redirect_to leaves_path
      end
    else
      redirect_to new_user_session_path
    end

  end
  
  def create
    new_leave_type = LeaveType.create(:description => params[:description])
    new_leave_type.save
    redirect_to leave_types_path
  end

  def destroy
    leave_type_to_delete = LeaveType.find(params[:id])
    leave_type_to_delete.destroy!
    redirect_to leave_types_path
  end

end
