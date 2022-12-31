RSpec.shared_examples 'a transactable' do
  subject { create(described_class.name.underscore.to_sym, :with_created_by) }

  let_it_be(:transactable) { described_class.name.underscore }
  let_it_be(:transactables) { transactable.pluralize }

  it { is_expected.to belong_to(:created_by).class_name('User').inverse_of("#{transactables}_created".to_sym) }

  it { is_expected.to monetize(:amount) }
  it { is_expected.to validate_length_of(:description).is_at_most(255) }

  it 'defaults incurred_at to current time' do
    record = build(transactable.to_sym, created_by: create(:user), incurred_at: nil).tap(&:save)

    expect { record.reload }.to change { record.incurred_at }.from(nil).to be_within(1).of(Time.current)
  end

  it 'defaults incurred_by to created_by' do
    record = build(transactable.to_sym, created_by: create(:user), incurred_by: nil)

    expect { record.save }.to change { record.incurred_by }.from(nil).to(record.created_by)
  end
end
