class Company < ApplicationRecord
  has_secure_password

  has_many :employees
  has_many :payrolls
  has_many :paychecks, through: :payrolls
  has_many :adjustments, through: :employees

  def hourly
    self.employees.where("pay_type = ?", "Hourly")
  end

  def salary
    self.employees.where("pay_type = ?", "Salary")
  end

  # def hours(hours)
  #   self.hourly.map do |employee|
  #     employee.worked_last_week(hours)
  #   end.sum
  # end

  # def ot_hours
  #   self.hourly.map do |employee|
  #   employee.total_hours("ot_hours")
  #   end.sum
  # end


  def salary_payout
    self.salary.map{|employee| employee.pay_rate}.sum
  end

end
