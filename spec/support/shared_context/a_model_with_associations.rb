RSpec.shared_context 'a model with associations' do # rubocop:disable RSpec/SharedContext, RSpec/ContextWording
  described_class.reflect_on_all_associations.map(&:name).each do |association|
    it { is_expected.to be_inverse_of(association) }
  end
end

RSpec.configure do |config|
  # This is a hack b/c there is no config.include_examples method.
  # We include these examples globally for every type: :model to avoid forgetting to add include_examples 'a model with associations' to a model spec.
  # We could try overriding the RSpec model spec generator instead, but this seems less likely to break in the long-run.
  config.include_context 'a model with associations', type: :model
end
