class Employee < ApplicationRecord
  belongs_to :company
  has_many :paychecks
  has_many :adjustments
  has_many :payrolls, through: :paychecks
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :pay_rate, numericality: { greater_than: 0 }

  accepts_nested_attributes_for :adjustments, reject_if: :all_blank, allow_destroy: true


  def full_name
    "#{self.last_name}, #{self.first_name}"
  end


  def first_last
    "#{self.first_name} #{self.last_name}"
  end

  def total_hours(hours)
    self.paychecks.map{|paycheck| paycheck.send(hours)}.sum
  end

end
