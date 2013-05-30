class LeaveTypesController < ApplicationController
  
  def index
    @leave_types = LeaveType.all
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
