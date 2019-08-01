class CreatePayrolls < ActiveRecord::Migration[5.2]
  def change
    create_table :payrolls do |t|
      t.integer :company_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
