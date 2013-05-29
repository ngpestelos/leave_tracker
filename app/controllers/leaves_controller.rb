class LeavesController < ApplicationController
  include LeavesHelper

  def index
    if user_signed_in?
      @leaves = Leave.all
      @leaves = format_for_calendar(@leaves).to_json
      @leave_types = get_leave_types 
    else
      redirect_to new_user_session_path 
    end
  end
  
  def create
    new_leave = current_user.leaves.create(:leave_type_id => params[:leave_type],
                         :date => Date.strptime(params[:date], "%m/%d/%Y"))
    new_leave.save
    redirect_to leaves_path
  end

  def destroy
    if current_user.role == "employee"
      leave = current_user.leaves.find_by_id(params[:id])
      unless leave.nil?
        current_user.leaves.destroy(params[:id])
      end
    elsif current_user.role == "hr"
      Leave.destroy(params[:id])
    end
    redirect_to leaves_path
  end

  def update
    if current_user.role == "employee"
      leave = current_user.leaves.find_by_id(params[:id]) 
      unless leave.nil?
        leave.update_attributes(:leave_type_id => params[:leave_type],
                              :date => Date.strptime(params[:date], "%m/%d/%Y")) 
      end
    elsif current_user.role == "hr"
      leave = Leave.find_by_id(params[:id])
      leave.update_attributes(:is_approved => params[:is_approved])
    end
    redirect_to leaves_path
  end

end
