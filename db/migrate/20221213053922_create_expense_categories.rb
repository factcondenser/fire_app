class CreateExpenseCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_categories, id: :uuid do |t|
      t.string :name, null: false, limit: 63
      t.references :parent, type: :uuid, foreign_key: { to_table: :expense_categories }
      t.index [:name, :parent_id], unique: true

      t.timestamps
    end
  end
end