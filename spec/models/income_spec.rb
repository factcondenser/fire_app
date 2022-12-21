require 'rails_helper'

RSpec.describe Income do
  it { is_expected.to belong_to(:created_by).class_name('User') }
  it { is_expected.to belong_to(:incurred_by).class_name('User') }
  it { is_expected.to belong_to(:category).class_name('IncomeCategory') }
  it { is_expected.to have_many(:labelings).dependent(:destroy) }
  it { is_expected.to have_many(:labels).through(:labelings) }
  it { is_expected.to monetize(:amount) }
  it { is_expected.to validate_length_of(:description).is_at_most(255) }

  it 'assigns current time as default incurred_at' do
    income = build(:income, created_by: create(:user), incurred_at: nil)
    incurred_at = 1.minute.ago

    expect { travel_to(incurred_at) { income.save } }.to change { income.incurred_at }.from(nil).to be_within(1).of(incurred_at)
  end

  it 'assigns created_by as default incurred_by' do
    income = build(:income, created_by: create(:user), incurred_by: nil)

    expect { income.save }.to change { income.incurred_by }.from(nil).to(income.created_by)
  end

  it 'assigns a default category' do
    default_category = create(:income_category, user: create(:user), name: IncomeCategory::DEFAULT_CATEGORY)
    income = build(:income, category: nil)

    expect { income.save }.to change { income.category }.from(nil).to(default_category)
  end
end
