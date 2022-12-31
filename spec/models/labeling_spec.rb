require 'rails_helper'

RSpec.describe Labeling do
  it { is_expected.to belong_to(:label).inverse_of(:labelings) }
  it { is_expected.to belong_to(:labelable).inverse_of(:labelings) }
  it { is_expected.to validate_inclusion_of(:labelable_type).in_array(%w[Expense Income]) }

  context 'with pre-existing record' do
    subject { create(:labeling, :expense) }

    it { is_expected.to validate_uniqueness_of(:label_id).scoped_to(:labelable_id).case_insensitive }
  end
end
