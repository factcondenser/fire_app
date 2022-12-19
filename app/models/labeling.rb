class Labeling < ApplicationRecord
  LABELABLE_TYPES = %w[Expense Income].freeze

  belongs_to :label
  belongs_to :labelable, polymorphic: true

  validates :labelable_type, inclusion: { in: LABELABLE_TYPES }
end
