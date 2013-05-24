class LeavesController < ApplicationController

  def show

  end
  
  def create
    new_leave = Leave.new(:leave_type => params[:leave_type],
                         :date => params[:date])
    new_leave.save
  end
end
