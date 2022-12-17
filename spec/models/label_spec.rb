require 'rails_helper'

RSpec.describe Label do
  subject { create(:label) }

  it { is_expected.to validate_length_of(:name).is_at_most(63) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
