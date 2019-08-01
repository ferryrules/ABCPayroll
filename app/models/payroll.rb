class Payroll < ApplicationRecord
  belongs_to :company
  has_many :paychecks, inverse_of: :payroll
  has_many :employees, through: :paychecks
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :order

  accepts_nested_attributes_for :paychecks, reject_if: :all_blank, allow_destroy: true

  def order
    if self[:end_date] == nil || self[:start_date] == nil
      errors.add(:end_date, "can not be empty")
    elsif self[:end_date] < self[:start_date]
      errors.add(:end_date, "can not be smaller than start date ")
    end
  end

  def hourly_paychecks
    self.paychecks.select {|p| p.employee.pay_type == "Hourly"}
  end

  def salary_paychecks
    self.paychecks.select {|p| p.employee.pay_type == "Salary"}
  end


end
