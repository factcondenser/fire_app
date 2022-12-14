require 'rails_helper'

RSpec.describe Income do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:category).class_name('IncomeCategory') }
  it { is_expected.to monetize(:amount) }
  it { is_expected.to validate_length_of(:description).is_at_most(255) }

  it 'assigns itself a default category' do
    default_category = create(:income_category, name: IncomeCategory::DEFAULT_CATEGORY)
    income = build(:income, category: nil)

    expect { income.save }.to change { income.category }.from(nil).to(default_category)
  end
end
