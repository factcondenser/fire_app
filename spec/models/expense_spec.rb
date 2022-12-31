require 'rails_helper'

RSpec.describe Expense do
  it_behaves_like 'a categorizable'
  it_behaves_like 'a labelable'
  it_behaves_like 'a transactable'
end
