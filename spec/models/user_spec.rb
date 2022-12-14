require 'rails_helper'

RSpec.describe User do
  subject { build(:user) }

  it { is_expected.to have_many(:expenses).dependent(:destroy) }
  it { is_expected.to have_many(:incomes).dependent(:destroy) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to have_secure_password }
end
