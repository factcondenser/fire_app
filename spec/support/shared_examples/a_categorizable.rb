RSpec.shared_examples 'a categorizable' do
  subject { create(described_class.name.underscore.to_sym, :with_created_by) }

  it 'defaults category to default category' do
    record = build(described_class.name.underscore.to_sym, created_by: create(:user), category: nil)

    expect { record.save }.to change { record.category }.from(nil).to(
      record.created_by.public_send("#{described_class.name.underscore}_categories").default
    )
  end
end
