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
    @all_leave_types = LeaveType.all
    @leave_types_display = []
    user_leave_types.each do |leave_type|
      leave_type_description = leave_type.leave_type.description
      leave_type_number = leave_type.number
      @all_leave_types = @all_leave_types - Array(leave_type.leave_type)
      @leave_types_display << {:id => leave_type.leave_type.id, :description => leave_type_description, :number => leave_type_number}
    end
    @all_leave_types.map!{ |e| [e.description,e.id]}
  end

  def update
    user = User.find(params[:id])
    leave_to_change = user.number_of_leaves_per_types.find_by_leave_type_id(params[:pk])
    leave_to_change.update_attributes(:number => params[:value])
    render :json => true
  end

  def create
    user = User.find(params[:id])
    new_leave_type = user.number_of_leaves_per_types.create(:leave_type_id => params[:leave_type], :number => params[:number])
    new_leave_type.save!
    redirect_to user_leaves_path(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    leave_to_destroy = user.number_of_leaves_per_types.find_by_leave_type_id(params[:pk])
    leave_to_destroy.destroy
    redirect_to user_leaves_path(params[:id])
  end

end
