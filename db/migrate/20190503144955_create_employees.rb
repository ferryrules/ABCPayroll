class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.belongs_to :company, foreign_key: true
      t.string :pay_type
      t.float :pay_rate
      t.boolean :active, default: true
      t.string :filing_status, default: "Single"
      t.integer  :allowances, default: 0 

      t.timestamps
    end
  end
end
