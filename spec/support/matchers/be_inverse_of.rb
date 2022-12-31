RSpec::Matchers.define :be_inverse_of do |expected|
  match do |actual|
    actual.class.reflect_on_association(expected).has_inverse?
  end
end
