require 'rails_helper'

RSpec.describe IncomeCategory do
  it_behaves_like 'a colorable'

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:parent).class_name('IncomeCategory').optional }

  it {
    is_expected.to have_many(:subcategories).class_name('IncomeCategory')
                                            .with_foreign_key(:parent_id)
                                            .inverse_of(:parent)
                                            .dependent(:destroy)
  }

  it {
    is_expected.to have_many(:incomes).with_foreign_key(:category_id)
                                      .inverse_of(:category)
                                      .dependent(:destroy)
  }

  it { is_expected.to validate_length_of(:name).is_at_most(63) }
  it { is_expected.to validate_presence_of(:name) }

  context 'with pre-existing record' do
    subject { create(:income_category, :with_user) }

    it { is_expected.to validate_uniqueness_of(:name).scoped_to(%i[user_id parent_id]) }
  end
end
