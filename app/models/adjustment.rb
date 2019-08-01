class Adjustment < ApplicationRecord
  belongs_to :employee
  validates :description, presence: true, allow_blank: false
  validates :adj_amount, presence: true, numericality: {greater_than: 0}
end
