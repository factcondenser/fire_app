class Income < ApplicationRecord
  before_validation :assign_default_category

  belongs_to :user
  belongs_to :category, class_name: 'IncomeCategory'

  monetize :amount_cents, numericality: { greater_than: 0 }

  validates :description, length: { maximum: 255 }

  private

  def assign_default_category
    return if category_id.present?

    self.category_id = IncomeCategory.where(name: IncomeCategory::DEFAULT_CATEGORY).pick(:id)
  end
end
