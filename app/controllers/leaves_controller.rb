class LeavesController < ApplicationController
  include LeavesHelper

  respond_to :html, :json

  def show
    respond_with Leave.find(:all).to_json
  end
  
  def create
    new_leave = Leave.new(:leave_type => params[:leave_type],
                         :date => params[:date])
    new_leave.save
    render :json => format_for_calendar([new_leave])
  end
end
