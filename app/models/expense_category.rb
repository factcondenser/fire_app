class ExpenseCategory < ApplicationRecord
  DEFAULT_CATEGORY = 'Uncategorized'.freeze

  belongs_to :parent, class_name: 'ExpenseCategory', optional: true
  has_many :subcategories, class_name: 'ExpenseCategory', foreign_key: :parent_id, inverse_of: :parent,
                           dependent: :destroy
  has_many :expenses, foreign_key: :category_id, inverse_of: :category, dependent: :destroy

  validates :name, length: { maximum: 63 }, presence: true, uniqueness: { scope: :parent_id }
end
