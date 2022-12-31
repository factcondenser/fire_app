class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  class << self
    def belongs_to_polymorphic(name, allowed_classes:, **options)
      belongs_to name, polymorphic: true, **options

      validates "#{name}_type", inclusion: { in: allowed_classes.map(&:name) }

      singleton_class.define_method("#{name}_types") { allowed_classes }

      # generate scope for each allowed class
      allowed_classes.each do |model|
        scope "with_#{name}_#{model.name.underscore.tr('/', '_')}", -> { where("#{name}_type" => model.name) }
      end
    end
  end
end
