class User < ApplicationRecord
  has_secure_password

  has_many :expense_categories, dependent: :destroy
  has_many :income_categories, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :incomes, dependent: :destroy
  has_many :labels, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
