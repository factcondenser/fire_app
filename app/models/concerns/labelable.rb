module Labelable
  extend ActiveSupport::Concern

  included do
    has_many :labelings, as: :labelable, dependent: :destroy
    has_many :labels, through: :labelings, inverse_of: name.underscore.pluralize.to_sym
  end
end
