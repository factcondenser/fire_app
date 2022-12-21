class IncomeCategory < ApplicationRecord
  DEFAULT_CATEGORY = 'Uncategorized'.freeze

  CATEGORIES = {
    'Bonuses' => [],
    'Business' => [],
    'Gift' => [],
    'Investment' => ['Sale of Stock', 'Dividends/Interest'],
    'Wages' => [],
    'Real Estate' => [],
    DEFAULT_CATEGORY => []
  }.freeze

  belongs_to :user
  belongs_to :parent, class_name: 'IncomeCategory', optional: true
  has_many :subcategories, class_name: 'IncomeCategory', foreign_key: :parent_id, inverse_of: :parent, dependent: :destroy
  has_many :incomes, foreign_key: :category_id, inverse_of: :category, dependent: :destroy

  validates :name, length: { maximum: 63 }, presence: true, uniqueness: { scope: %i[user_id parent_id] }
end
