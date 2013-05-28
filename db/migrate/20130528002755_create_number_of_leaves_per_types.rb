class CreateNumberOfLeavesPerTypes < ActiveRecord::Migration
  def change
    create_table :number_of_leaves_per_types do |t|
      t.integer :leave_type_id
      t.integer :user_id
      t.integer :number
      t.timestamps
    end
  end
end
