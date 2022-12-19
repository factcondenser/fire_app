require 'rails_helper'

RSpec.describe Labeling do
  it { is_expected.to belong_to(:label) }
  it { is_expected.to belong_to(:labelable) }
  it { is_expected.to validate_inclusion_of(:labelable_type).in_array(%w[Expense Income]) }
end
