require 'rails_helper'

RSpec.describe Expense do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:category).class_name('ExpenseCategory') }
  it { is_expected.to monetize(:amount) }
  it { is_expected.to validate_length_of(:description).is_at_most(255) }

  it 'assigns itself a default category' do
    default_category = create(:expense_category, name: ExpenseCategory::DEFAULT_CATEGORY)
    expense = build(:expense, category: nil)

    expect { expense.save }.to change { expense.category }.from(nil).to(default_category)
  end
end
