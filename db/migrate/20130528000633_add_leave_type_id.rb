class AddLeaveTypeId < ActiveRecord::Migration
  def change
    add_column :leaves, :leave_type_id, :integer 
    remove_column :leaves, :leave_type 
  end
end
