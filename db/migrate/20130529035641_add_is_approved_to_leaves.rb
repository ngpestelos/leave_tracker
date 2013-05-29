class AddIsApprovedToLeaves < ActiveRecord::Migration
  def change
    add_column :leaves, :is_approved, :integer
  end
end
