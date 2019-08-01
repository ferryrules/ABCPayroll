class Paycheck < ApplicationRecord
  belongs_to :payroll
  belongs_to :employee
  has_many :paycheck_adjustments
  # validate :hours_validation



  accepts_nested_attributes_for :paycheck_adjustments, reject_if: :all_blank, allow_destroy: true

  def self.non_ot_hour_types
    ["hours", "vacation_hours", "pto_hours", "sick_hours", "holiday_hours"]
  end

  def self.all_hour_types
    ["hours", "ot_hours", "vacation_hours", "pto_hours", "sick_hours", "holiday_hours"]
  end

  # def hours_validation
  #   if self.employee.pay_type == "Hourly"
  #     if  self[:hours] > 40
  #       errors.add(:hours, "over 40 need to be placed in Over Time")
  #     end
  #   end
  # end

  def self.total_hours(paycheck_arr, hour_type)
    paycheck_arr.map do |paycheck|
      paycheck.send(hour_type)
    end.sum
  end

  def total_pay_amt
    if self.employee.pay_type == "Hourly"
      pay_rate = self.employee.pay_rate

      non_ot = Paycheck.non_ot_hour_types.sum do |h_t|
        self.send(h_t)
      end

      (pay_rate * (non_ot + (self.ot_hours * 1.5))).to_f
    elsif self.employee.pay_type == "Salary"
      self.employee.pay_rate
    end
  end
end
