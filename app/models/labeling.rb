class Labeling < ApplicationRecord
  LABELABLE_TYPES = %w[Expense Income].freeze

  belongs_to :label, inverse_of: :labelings
  belongs_to :labelable, polymorphic: true, inverse_of: :labelings

  validates :labelable_type, inclusion: { in: LABELABLE_TYPES }
  validates :label_id, uniqueness: { scope: :labelable_id, case_sensitive: false }
end
