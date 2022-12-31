class Expense < ApplicationRecord
  include Categorizable
  include Labelable
  include Transactable
end
