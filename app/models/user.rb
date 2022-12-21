class User < ApplicationRecord
  has_secure_password

  has_many :expense_categories, dependent: :destroy
  has_many :income_categories, dependent: :destroy
  has_many :expenses_created, class_name: 'Expense', foreign_key: :created_by_id, inverse_of: :created_by, dependent: :destroy
  has_many :expenses_incurred, class_name: 'Expense', foreign_key: :incurred_by_id, inverse_of: :incurred_by, dependent: :destroy
  has_many :incomes_created, class_name: 'Income', foreign_key: :created_by_id, inverse_of: :created_by, dependent: :destroy
  has_many :incomes_incurred, class_name: 'Income', foreign_key: :incurred_by_id, inverse_of: :incurred_by, dependent: :destroy
  has_many :labels, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
