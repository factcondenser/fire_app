class IncomeCategory < ApplicationRecord
  include Colorable

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

  belongs_to :user, inverse_of: :income_categories
  belongs_to :parent, class_name: 'IncomeCategory', inverse_of: :subcategories, optional: true
  has_many :subcategories, class_name: 'IncomeCategory', foreign_key: :parent_id, inverse_of: :parent, dependent: :destroy
  has_many :incomes, foreign_key: :category_id, inverse_of: :category, dependent: :destroy

  validates :name, length: { maximum: 63 }, presence: true, uniqueness: { scope: %i[user_id parent_id] }

  def self.default
    find_or_create_by(name: DEFAULT_CATEGORY)
  end
end
