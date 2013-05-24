class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.date :date
      t.integer :leave_type
      t.timestamps
    end
  end
end
