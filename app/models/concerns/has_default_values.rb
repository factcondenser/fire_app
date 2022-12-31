module HasDefaultValues
  extend ActiveSupport::Concern

  class_methods do
    private

    def defaults(attr_name, to:, on_callback: :before_validation)
      method_name = "set_default_#{attr_name}"
      public_send(on_callback, method_name.to_sym)

      define_method(method_name) do
        return if public_send(attr_name).present?

        attr_value = to.is_a?(Proc) ? instance_exec(&to) : to
        public_send("#{attr_name}=", attr_value)
      end

      private method_name
    end
  end
end
