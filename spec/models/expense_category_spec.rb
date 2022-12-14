require 'rails_helper'

RSpec.describe ExpenseCategory do
  subject { create(:expense_category, :with_parent) }

  it { is_expected.to belong_to(:parent).class_name('ExpenseCategory').optional }

  it {
    is_expected.to have_many(:subcategories).class_name('ExpenseCategory')
                                            .with_foreign_key(:parent_id)
                                            .inverse_of(:parent)
                                            .dependent(:destroy)
  }

  it {
    is_expected.to have_many(:expenses).with_foreign_key(:category_id)
                                       .inverse_of(:category)
                                       .dependent(:destroy)
  }

  it { is_expected.to validate_length_of(:name).is_at_most(63) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:parent_id) }
end
