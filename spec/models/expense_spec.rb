require 'rails_helper'

RSpec.describe Expense do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:category).class_name('ExpenseCategory') }
  it { is_expected.to have_many(:labelings).dependent(:destroy) }
  it { is_expected.to have_many(:labels).through(:labelings) }
  it { is_expected.to monetize(:amount) }
  it { is_expected.to validate_length_of(:description).is_at_most(255) }

  it 'assigns itself a default incurred_at' do
    expense = build(:expense, incurred_at: nil)
    incurred_at = 1.minute.ago

    expect { travel_to(incurred_at) { expense.save } }.to change { expense.incurred_at }.from(nil).to be_within(1).of(incurred_at)
  end

  it 'assigns itself a default category' do
    default_category = create(:expense_category, name: ExpenseCategory::DEFAULT_CATEGORY)
    expense = build(:expense, category: nil)

    expect { expense.save }.to change { expense.category }.from(nil).to(default_category)
  end
end
