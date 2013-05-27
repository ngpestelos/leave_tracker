class LeavesController < ApplicationController
  include LeavesHelper

  def index
    @leaves = Leave.all
    @leaves = format_for_calendar(@leaves).to_json
  end
  
  def create
    new_leave = current_user.leaves.create(:leave_type => params[:leave_type],
                         :date => params[:date])
    new_leave.save
    redirect_to leaves_path
  end

  def destroy
    leave = current_user.leaves.find_by_id(params[:id])
    unless leave.nil?
      current_user.leaves.destroy(params[:id])
    end
    redirect_to leaves_path
  end

  def update
    leave = current_user.leaves.find_by_id(params[:id]) 
    unless leave.nil?
      leave.update_attributes(:leave_type => params[:leave_type],
                              :date => params[:date]) 
    end
    redirect_to leaves_path
  end

end
