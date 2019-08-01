class CreatePaycheckAdjustments < ActiveRecord::Migration[5.2]
  def change
    create_table :paycheck_adjustments do |t|
      t.integer :paycheck_id
      t.string :adj_type
      t.string :description, default: "Enter description here"
      t.float :adj_amount, default: 9999.99

      t.timestamps
    end
  end
end
