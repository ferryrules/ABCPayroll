class AddCheckDateAndStatusToPayrolls < ActiveRecord::Migration[5.2]
  def change
    add_column :payrolls, :check_date, :date
    add_column :payrolls, :status, :string
  end
end
