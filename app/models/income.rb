class Income < ApplicationRecord
  before_validation :assign_default_incurred_at
  before_validation :assign_default_category

  belongs_to :user
  belongs_to :category, class_name: 'IncomeCategory'
  has_many :labelings, as: :labelable, dependent: :destroy
  has_many :labels, through: :labelings

  monetize :amount_cents, numericality: { greater_than: 0 }

  validates :description, length: { maximum: 255 }

  private

  def assign_default_incurred_at
    return if incurred_at.present?

    self.incurred_at = Time.current
  end

  def assign_default_category
    return if category_id.present?

    self.category_id = IncomeCategory.where(name: IncomeCategory::DEFAULT_CATEGORY).pick(:id)
  end
end
