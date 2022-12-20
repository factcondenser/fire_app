class Label < ApplicationRecord
  belongs_to :user
  has_many :labelings, dependent: :destroy
  has_many :expenses, through: :labelings, source: :labelable, source_type: 'Expense'
  has_many :incomes, through: :labelings, source: :labelable, source_type: 'Income'

  validates :name, length: { maximum: 63 }, presence: true, uniqueness: true
end
