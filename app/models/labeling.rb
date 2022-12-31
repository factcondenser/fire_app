class Labeling < ApplicationRecord
  belongs_to :label, inverse_of: :labelings
  belongs_to_polymorphic :labelable, allowed_classes: [Expense, Income], inverse_of: :labelings

  validates :label_id, uniqueness: { scope: :labelable_id, case_sensitive: false }
end
