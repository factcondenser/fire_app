module Categorizable
  extend ActiveSupport::Concern

  included do
    include HasDefaultValues

    belongs_to :category, class_name: "#{name}Category", inverse_of: name.underscore.pluralize.to_sym

    defaults :category, to: -> { created_by.public_send("#{self.class.name.underscore}_categories").default }
  end
end
