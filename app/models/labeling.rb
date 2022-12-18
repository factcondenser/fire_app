class Labeling < ApplicationRecord
  belongs_to :user
  belongs_to :label
  belongs_to :labelable, polymorphic: true

  validates :labelable_type, inclusion: { in: %w[Expense Income] }
end
