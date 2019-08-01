class CreateAdjustments < ActiveRecord::Migration[5.2]
  def change
    create_table :adjustments do |t|
      t.string :adj_type
      t.string :description, default: "Enter description here"
      t.float :adj_amount, default: 9999.99
      t.integer :employee_id

      t.timestamps
    end
  end
end
