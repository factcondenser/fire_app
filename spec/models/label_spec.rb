require 'rails_helper'

RSpec.describe Label do
  it_behaves_like 'a colorable'

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:labelings).dependent(:destroy) }
  it { is_expected.to have_many(:expenses).through(:labelings).source(:labelable) }
  it { is_expected.to have_many(:incomes).through(:labelings).source(:labelable) }
  it { is_expected.to validate_length_of(:name).is_at_most(63) }
  it { is_expected.to validate_presence_of(:name) }

  context 'with pre-existing record' do
    subject { create(:label, :with_user) }

    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:user_id) }
  end
end
