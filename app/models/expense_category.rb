class ExpenseCategory < ApplicationRecord
  DEFAULT_CATEGORY = 'Uncategorized'.freeze

  CATEGORIES = {
    'Business' => [],
    'Charity' => [],
    'Comms' => %w[Internet Phone],
    'Education' => ['Books', 'Online Materials'],
    'Entertainment' => [],
    'Family' => [],
    'Fitness' => [],
    'Food' => %w[Groceries Restaurant],
    'Friends' => [],
    'Housing' => %w[Mortgage Rent],
    'Insurance' => %w[Dental Health Life Renter's Vision],
    'Supplies' => %w[Clothing Furniture Grooming Kitchen Maintenance Office Toiletries],
    'Taxes' => ['FICA', 'Federal Witholding', 'State Witholding'],
    'Transport' => %w[Bike Bus Rideshare],
    'Utitlies' => %w[Electric Gas Laundry Water],
    DEFAULT_CATEGORY => []
  }.freeze

  belongs_to :user
  belongs_to :parent, class_name: 'ExpenseCategory', optional: true
  has_many :subcategories, class_name: 'ExpenseCategory', foreign_key: :parent_id, inverse_of: :parent,
                           dependent: :destroy
  has_many :expenses, foreign_key: :category_id, inverse_of: :category, dependent: :destroy

  validates :name, length: { maximum: 63 }, presence: true, uniqueness: { scope: :parent_id }
end
