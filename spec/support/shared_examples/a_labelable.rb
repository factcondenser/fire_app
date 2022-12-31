RSpec.shared_examples 'a labelable' do
  it { is_expected.to have_many(:labelings).dependent(:destroy) }
  it { is_expected.to have_many(:labels).through(:labelings).inverse_of(described_class.name.underscore.pluralize.to_sym) }
end
