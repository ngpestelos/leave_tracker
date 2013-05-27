class LeavesController < ApplicationController
  include LeavesHelper

  def index
    @leaves = Leave.all
    @leaves = format_for_calendar(@leaves).to_json
  end
  
  def create
    new_leave = Leave.new(:leave_type => params[:leave_type],
                         :date => params[:date])
    new_leave.save
    render :json => format_for_calendar([new_leave])
  end
end
