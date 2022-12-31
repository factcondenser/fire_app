module Transactable
  extend ActiveSupport::Concern

  included do
    include HasDefaultValues

    belongs_to :created_by, class_name: 'User', inverse_of: "#{name.underscore.pluralize}_created".to_sym
    belongs_to :incurred_by, class_name: 'User', inverse_of: "#{name.underscore.pluralize}_incurred".to_sym

    defaults :incurred_by, to: -> { created_by }

    monetize :amount_cents, numericality: { greater_than: 0 }

    validates :description, length: { maximum: 255 }
  end
end
