class Income < ApplicationRecord
  include Categorizable
  include Labelable
  include Transactable
end
