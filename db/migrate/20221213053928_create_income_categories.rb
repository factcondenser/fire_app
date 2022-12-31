class CreateIncomeCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :income_categories, id: :uuid do |t|
      t.string :name, null: false, limit: 63
      t.string :background_color, null: false
      t.string :foreground_color, null: false

      t.references :parent, type: :uuid, foreign_key: { to_table: :income_categories }
      t.references :user, type: :uuid, null: false, foreign_key: true, index: false

      t.index [:user_id, :name, :parent_id], unique: true

      t.check_constraint "regexp_like(background_color, '#{Colorable::FORMAT_REGEX}')"
      t.check_constraint "regexp_like(foreground_color, '#{Colorable::FORMAT_REGEX}')"

      t.timestamps
    end
  end
end
