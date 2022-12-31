class Label < ApplicationRecord
  include Colorable

  belongs_to :user, inverse_of: :labels
  has_many :labelings, dependent: :destroy
  has_many :expenses, through: :labelings, source: :labelable, source_type: 'Expense', inverse_of: :labels
  has_many :incomes, through: :labelings, source: :labelable, source_type: 'Income', inverse_of: :labels

  validates :name, length: { maximum: 63 }, presence: true, uniqueness: { scope: :user_id }

  scope :expense, -> { joins(:expenses) }
  scope :income, -> { joins(:incomes) }
end
