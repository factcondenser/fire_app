require 'rails_helper'

RSpec.describe User do
  subject { build(:user) }

  it { is_expected.to have_secure_password }
  it { is_expected.to have_many(:expense_categories).dependent(:destroy) }
  it { is_expected.to have_many(:income_categories).dependent(:destroy) }
  it { is_expected.to have_many(:expenses_created).class_name('Expense').with_foreign_key(:created_by_id).inverse_of(:created_by).dependent(:destroy) }
  it { is_expected.to have_many(:expenses_incurred).class_name('Expense').with_foreign_key(:incurred_by_id).inverse_of(:incurred_by).dependent(:destroy) }
  it { is_expected.to have_many(:incomes_created).class_name('Income').with_foreign_key(:created_by_id).inverse_of(:created_by).dependent(:destroy) }
  it { is_expected.to have_many(:incomes_incurred).class_name('Income').with_foreign_key(:incurred_by_id).inverse_of(:incurred_by).dependent(:destroy) }
  it { is_expected.to have_many(:labels).dependent(:destroy) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
end
