class PaycheckAdjustment < ApplicationRecord
  belongs_to :paycheck
  validates :description, presence: true, allow_blank: false
  validates :adj_amount, presence: true, numericality: {greater_than: 0}
end
