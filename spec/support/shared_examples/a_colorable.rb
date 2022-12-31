RSpec.shared_examples 'a colorable' do
  it { is_expected.to allow_values(*Array.new(100) { Faker::Color.hex_color }).for(:background_color) }
  it { is_expected.not_to allow_values(%w[#FFFFFF ffffff #gggggg #ffffff\n]).for(:background_color) }
  it { is_expected.to allow_values(*Array.new(100) { Faker::Color.hex_color }).for(:foreground_color) }
  it { is_expected.not_to allow_values(%w[#FFFFFF ffffff #gggggg #ffffff\n]).for(:foreground_color) }

  it 'defaults background_color to default background color' do
    colorable = build(described_class.name.underscore.to_sym, background_color: nil)

    expect { colorable.valid? }.to change { colorable.background_color }.from(nil).to(Colorable::DEFAULT_BACKGROUND_COLOR)
  end

  it 'defaults foreground color to default foreground color' do
    colorable = build(described_class.name.underscore.to_sym, foreground_color: nil)

    expect { colorable.valid? }.to change { colorable.foreground_color }.from(nil).to(Colorable::DEFAULT_FOREGROUND_COLOR)
  end
end
