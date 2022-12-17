class Label < ApplicationRecord
  validates :name, length: { maximum: 63 }, presence: true, uniqueness: true
end
