class Expense < ApplicationRecord
  before_validation :assign_default_incurred_at
  before_validation :assign_default_incurred_by
  before_validation :assign_default_category

  belongs_to :created_by, class_name: 'User'
  belongs_to :incurred_by, class_name: 'User'
  belongs_to :category, class_name: 'ExpenseCategory'
  has_many :labelings, as: :labelable, dependent: :destroy
  has_many :labels, through: :labelings

  monetize :amount_cents, numericality: { greater_than: 0 }

  validates :description, length: { maximum: 255 }

  private

  def assign_default_incurred_at
    return if incurred_at.present?

    self.incurred_at = Time.current
  end

  def assign_default_incurred_by
    return if incurred_by.present?

    self.incurred_by = created_by
  end

  def assign_default_category
    return if category_id.present?

    self.category_id = ExpenseCategory.where(name: ExpenseCategory::DEFAULT_CATEGORY).pick(:id)
  end
end
