class EnableCitext < ActiveRecord::Migration[7.0]
  def change
    enable_extension :citext unless extension_enabled?(:citext)
  end
end
